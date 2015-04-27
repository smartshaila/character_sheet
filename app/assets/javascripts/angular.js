//= require angular/angular
//= require angular-aria/angular-aria
//= require angular-animate/angular-animate
//= require angular-material/angular-material

atmlApp = angular.module('atmlApp', ['ngMaterial']);

atmlApp.factory('AdventuringClassModel', function() {
  var AdventuringClass = function (json) {
    this.proficiencies = [];

    this.initialize = function () {
      var self = this;
      angular.extend(self, json);
    };

    this.is_proficient = function (ability) {
      return this.proficiencies.some(function(cp_ability_id) {
        return cp_ability_id == ability.id;
      });
    };

    this.initialize();
  };

  return AdventuringClass;
});

atmlApp.factory('AdventuringClassService', function ($http, AdventuringClassModel) {
  var AdventuringClassService = function () {
    this.adventuring_classes = [null, new AdventuringClassModel({name:"Default", proficiencies:[]})];

    this.initialize = function () {
      var url = '../classes.json';
      var json = $http.get(url);
      var self = this;
      json.then(function (response) {
        for (key in response.data) {
          self.adventuring_classes[parseInt(key)] = new AdventuringClassModel(response.data[key]);
        }
      });
    };

    this.initialize();
  };

  return AdventuringClassService;
});

atmlApp.factory('LevelProgressionModel', function() {
  function LevelProgression (json) {
    var self = this;
    angular.extend(self, json);
  }

  return LevelProgression;
});

atmlApp.factory('LevelProgressionService', function ($http, LevelProgressionModel) {
  var LevelProgressionService = function () {
    this.level_progressions = [new LevelProgressionModel({level: 1, min_xp: 0, proficiency: 2}), new LevelProgressionModel({level: 2, min_xp: 300, proficiency: 2})];
    this.initialize = function () {
      var url = '../levels.json';
      var json = $http.get(url);
      var self = this;
      json.then(function (response) {
        self.level_progressions = response.data.map(function(lp) {
          return new LevelProgressionModel(lp);
        });
      });
    };

    this.getLevelProgression = function (current_xp) {
      return this.level_progressions.sort(function (a, b) {
        return b.level - a.level;
      }).find(function (lp) {
        return lp.min_xp <= current_xp;
      });
    };

    this.getNextLevelProgression = function (current_level) {
      return this.level_progressions.find(function (lp) {
        return lp.level == current_level + 1;
      });
    };

    this.initialize();
  };

  return LevelProgressionService;
});

atmlApp.factory('CharacterModel', function ($http, LevelProgressionService, AdventuringClassService) {
  var Character = function (character_id) {
    this.current_xp = 0;
    this.adventuring_class_id = 1;
    this.initialize = function () {
      var url = '../character_data/' + character_id + '.json';
      var json = $http.get(url);
      var self = this;

      json.then(function(response) {
        angular.extend(self, response.data);
      });
    };

    this.level_progression_service = new LevelProgressionService();
    this.adventuring_class_service = new AdventuringClassService();

    this.level_progression = function () {
      return this.level_progression_service.getLevelProgression(this.current_xp);
    };

    this.level = function () {
      return this.level_progression().level;
    };

    this.proficiency = function () {
      return this.level_progression().proficiency;
    };

    this.next_level = function () {
      return this.level_progression_service.getNextLevelProgression(this.level());
    };

    this.next_level_xp = function () {
      return this.next_level().min_xp - this.current_xp;
    };

    this.adventuring_class = function () {
      return this.adventuring_class_service.adventuring_classes[this.adventuring_class_id];
    };

    this.ability_proficiency = function (ability) {
      return this.adventuring_class().is_proficient(ability);
    };

    this.ability_proficiency_value = function (ability) {
      return this.ability_proficiency(ability) ? this.proficiency() : 0;
    };

    this.initialize();
  };

  return Character;
});

atmlApp.filter('modifier', function() {
  return function(value, proficiency) {
    var modifier = Math.floor((value - 10) / 2);
    if (proficiency != null) {
      modifier += proficiency;
    }
    return ((modifier >= 0) ? '+' : '') + modifier;
  }
});

atmlApp.controller('atmlCtrl', function ($scope, $http, $timeout, CharacterModel) {
  $scope.character = {};
  $scope.classes = [];
  $scope.urls = {};

  var save_updates = function () {
    $http.put('/characters/' + $scope.character.id + '.json', $scope.character);
  };

  var timeout = null;

  var debounce_save_updates = function (newVal, oldVal) {
    if (newVal != oldVal) {
      if (timeout) {
        $timeout.cancel(timeout)
      }
      timeout = $timeout(save_updates, 1000);  // 1000 = 1 second
    }
  };
  $scope.$watch('character.name', debounce_save_updates);
  $scope.$watch('character.race', debounce_save_updates);
  $scope.$watch('character.alignment', debounce_save_updates);
  $scope.$watch('character.current_xp', debounce_save_updates);
  $scope.$watch('character.adventuring_class_id', debounce_save_updates);
  $scope.$watch('character.speed', debounce_save_updates);
  $scope.$watch('character.notes', debounce_save_updates);

  $scope.init = function (id) {
    $scope.character = new CharacterModel(id);
    $scope.classes = $scope.character.adventuring_class_service.adventuring_classes;
    $http.get('../urls.json').then(function (value) {
      $scope.urls = value.data;
    });
  };
});