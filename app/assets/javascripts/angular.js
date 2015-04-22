//= require angular/angular
//= require angular-aria/angular-aria
//= require angular-animate/angular-animate
//= require angular-material/angular-material

atmlApp = angular
  .module('atmlApp',['ngMaterial'])
  .controller('atmlCtrl', function ($scope, $http){
    $scope.character = {
      current_xp: 0
    };
    $scope.levels = [];
    $scope.classes = [];

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

    $scope.init = function (id) {
      $http.get('../classes.json').then(function (value) { $scope.classes = value.data; });
      $http.get('../levels.json').then(function (value) { $scope.levels = value.data; });
      //Need to fix this; Overriding $scope.level etc
      $http.get('../character_data/' + id + '.json').then(function (value) { $scope.character = value.data; });
    };
  });