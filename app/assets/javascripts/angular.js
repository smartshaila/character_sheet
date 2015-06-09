//= require datatables/media/js/jquery.dataTables
//= require angular/angular
//= require angular-rails-templates
//= require angular-aria/angular-aria
//= require angular-animate/angular-animate
//= require angular-material/angular-material
//= require angular-datatables/dist/angular-datatables
//= require angular-bootstrap/ui-bootstrap
//= require angular-bootstrap/ui-bootstrap-tpls
//= require angular-material-icons/angular-material-icons
//= require_tree ../templates

atmlApp = angular.module('atmlApp', ['ngMaterial', 'datatables', 'ui.bootstrap', 'templates', 'ngMdIcons']);

atmlApp.factory('InventoryModel', function() {
  var Inventory = function (json) {

    this.initialize = function () {
      var self = this;
      angular.extend(self, json);
    };

    this.get_display_name = function () {
      var res = "";
      if (this.magic_bonus) {
        res = (parseInt(this.magic_bonus) >= 0) ? "+" : "";
        res += this.magic_bonus + " ";
      }
      if (this.name) {
        return res + this.name;
      } else if (this.magic) {
        return res + this.magic.name;
      } else {
        return res + this.item.name;
      }
    };

    this.get_display_description = function () {
      if (this.description) {
        return this.description;
      } else if (this.magic) {
        return this.magic.description;
      } else {
        return this.item.description;
      }
    };

    this.get_value = function () {
      return this.item.value;
    };

    this.get_weight = function () {
      return this.item.weight;
    };

    this.initialize();
  };

  return Inventory;
});

atmlApp.factory('ItemModel', function() {
  var Item = function (json) {
    this.selected = false;

    this.initialize = function () {
      var self = this;
      angular.extend(self, json);
    };

    this.initialize();
  };

  return Item;
});

atmlApp.factory('ItemService', function ($http, ItemModel) {
  var ItemService = function () {
    this.items = [];

    this.initialize = function () {
      var url = '../items.json';
      var json = $http.get(url);
      var self = this;
      json.then(function (response) {
        response.data.forEach(function(item) {
          self.items.push(new ItemModel(item));
        });
      });
    };

    this.getItems = function () {
      return this.items;
    };

    this.initialize();

  };

  return ItemService;
});

atmlApp.factory('SkillModel', function() {
  var Skill = function (json, is_proficient) {
    this.proficient = is_proficient;

    this.initialize = function () {
      var self = this;
      angular.extend(self, json);
    };

    this.initialize();
  };

  return Skill;
});

atmlApp.factory('SkillService', function ($http, SkillModel) {
  var SkillService = function (proficient_skills) {
    this.skills = [];

    this.initialize = function () {
      var url = '../skills.json';
      var json = $http.get(url);
      var self = this;
      json.then(function (response) {
        response.data.forEach(function(skill) {
          self.skills.push(new SkillModel(skill, proficient_skills.some(function (ps) {
            return skill.id == ps;
          })));
        });
      });
    };

    this.getSkills = function () {
      return this.skills;
    };

    this.initialize();

  };

  return SkillService;
});

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

atmlApp.factory('CharacterModel', function ($http, LevelProgressionService, AdventuringClassService, SkillService, InventoryModel) {
  var Character = function (character_id) {
    this.current_xp = 0;
    this.adventuring_class_id = 1;
    this.character_skills = [];
    this.character_abilities = [];
    this.inventories = [];
    this.initialize = function () {
      var url = '../character_data/' + character_id + '.json';
      var json = $http.get(url);
      var self = this;

      json.then(function(response) {
        angular.extend(self, response.data);
        self.skill_service = new SkillService(self.character_skills.map(function(cs) {
          return cs.skill_id;
        }));
        self.skills = self.skill_service.getSkills();
        self.inventories = self.inventories.map(function(inv) {
          return new InventoryModel(inv);
        });
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

    this.ability_score = function (ability) {
      return this.character_abilities.find( function (ca) {
        return ca.ability.id == ability.id;
      }).value;
    };

    this.total_inventory_value = function () {
      return this.inventories.reduce(function(sum, current) {
        return sum + current.quantity * current.get_value();
      }, 0);
    };

    this.total_inventory_weight = function () {
      return this.inventories.reduce(function(sum, current) {
        return sum + current.quantity * current.get_weight();
      }, 0);
    };

    this.apply_hp_change = function (hp_change, hp_change_type) {
      if (hp_change_type) {
        this.current_hp = Math.min(this.max_hp, this.current_hp + parseInt(hp_change));
      } else {
        this.current_hp = Math.max(0, this.current_hp - parseInt(hp_change));
      }
    };

    this.delete_inventory = function (inventory_id) {
      var self = this;
      $http.delete('/inventories/' + inventory_id + '.json').then(function(response) {
        self.inventories = self.inventories.filter(function(inventory) {
          return inventory['id'] != inventory_id;
        });
      });
    };

    this.get_inventory_by_id = function (inventory_id) {
      return this.inventories.find(function(inv) {
        return inv['id'] == inventory_id;
      });
    };

    this.armor_class = function () {
      var dex_score = this.character_abilities.find(function (ca) {
        return ca.ability.name == 'Dexterity';
      }).value;
      var dex_mod = Math.floor((dex_score - 10) / 2);
      var armors = this.inventories.filter(function (inv) {
        return inv.is_equipped && ('armor' in inv['item']);
      });
      dex_mod = armors.reduce(function (value, inv) {
        var max_ability = inv['item']['armor']['max_ability'];
        if (max_ability == null || max_ability > value) {
          return value;
        } else {
          return max_ability;
        }
      }, dex_mod);
      return armors.reduce(function (value, inv) {
        return value + inv['item']['armor']['base_ac'];
      }, dex_mod);
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

atmlApp.controller('atmlCtrl', function ($scope, $http, $timeout, CharacterModel, $mdDialog, ItemService) {
  $scope.character = {};
  $scope.classes = [];
  $scope.urls = {};

  $scope.skills_dtOptions = {bPaginate: false, bFilter: false, bInfo: false};

  $scope.showAdvanced = function(ev) {
    $mdDialog.show({
      controller: DialogController,
      templateUrl: 'add_inventory.html',
      targetEvent: ev,
      locals: { items: $scope.items, character: $scope.character }
    });
  };

  var save_character = function () {
    $http.put('/characters/' + $scope.character.id + '.json', $scope.character);
  };

  var timeout = null;

  var debounce_save_character = function (newVal, oldVal) {
    if (newVal != oldVal) {
      if (timeout) {
        $timeout.cancel(timeout)
      }
      timeout = $timeout(save_character, 1000);  // 1000 = 1 second
    }
  };

  $scope.$watchGroup(['character.name','character.race','character.alignment','character.current_xp','character.adventuring_class_id','character.speed','character.notes','character.current_hp','character.max_hp'], debounce_save_character);

  $scope.$watch('character.character_abilities', debounce_save_character, true);
  $scope.$watch('character.skills', debounce_save_character, true);
  $scope.$watch('character.inventories', debounce_save_character, true);

  $scope.init = function (id) {
    $scope.character = new CharacterModel(id);
    $scope.classes = $scope.character.adventuring_class_service.adventuring_classes;
    $scope.item_service = new ItemService();
    $scope.items = $scope.item_service.getItems();

    $http.get('../urls.json').then(function (value) {
      $scope.urls = value.data;
    });
  };
});

function DialogController($scope, $mdDialog, items, character, $http, InventoryModel) {
  $scope.items = items;
  $scope.character = character;
  $scope.cancel = function() {
    $mdDialog.cancel();
  };
  function get_selected_items () {
    return $scope.items.filter(function(item) {
      return item.selected;
    });
  }
  $scope.save_items_to_inventories = function () {
    var json = $http.post('/angular/inventories/' + $scope.character.id + '.json', {items: get_selected_items()});
    json.then(function(response) {
      $scope.character.inventories = response.data.map(function(inv) {
        return new InventoryModel(inv);
      });
    });
    $mdDialog.hide();
    $scope.items.forEach(function (item) {
      item.selected = false;
    });
  };
}

