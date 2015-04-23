//= require angular/angular
//= require angular-aria/angular-aria
//= require angular-animate/angular-animate
//= require angular-material/angular-material

atmlApp = angular
  .module('atmlApp',['ngMaterial'])
  .controller('atmlCtrl', function ($scope, $http, $timeout){
    $scope.character = {
      current_xp: 0
    };
    $scope.levels = [];
    $scope.classes = [];

    $scope.populate_classes = function (json) {
      for (key in json) {
        $scope.classes[parseInt(key)] = json[key];
      }
    };

    $scope.character.populate = function (json) {
      for (key in json) {
        $scope.character[key] = json[key];
      }
    };

    $scope.character.level_progression = function () {
      return $scope.levels.sort(function (a, b) {
          return b.level - a.level;
      }).find(function (lp) {
          return lp.min_xp <= $scope.character.current_xp;
      })
    };

    $scope.character.level = function () {
      return $scope.character.level_progression().level;
    };

    $scope.character.proficiency = function () {
      return $scope.character.level_progression().proficiency;
    };

    var save_updates = function () {
      $http.put('/characters/' + $scope.character.id, $scope.character);
    };

    var timeout = null;

    var debounce_save_updates = function(newVal, oldVal) {
      if (newVal != oldVal) {
        if (timeout) {
          $timeout.cancel(timeout)
        }
        timeout = $timeout(save_updates, 1000);  // 1000 = 1 second
      }
    };
    $scope.$watch('character.name', debounce_save_updates);
    $scope.$watch('character.current_xp', debounce_save_updates);

    $scope.init = function (id) {
      $http.get('../classes.json').then(function (value) { $scope.populate_classes(value.data); });
      $http.get('../levels.json').then(function (value) { $scope.levels = value.data; });
      $http.get('../character_data/' + id + '.json').then(function (value) { $scope.character.populate(value.data); });
    };
  });