//= require angular/angular
//= require angular-aria/angular-aria
//= require angular-animate/angular-animate
//= require angular-material/angular-material

atmlApp = angular
  .module('atmlApp',['ngMaterial'])
  .controller('atmlCtrl', function($scope, $http){
    $http.get('classes.json').then(function (value) { $scope.classes = value.data; });
    $http.get('levels.json').then(function (value) { $scope.levels = value.data; });
    $scope.character = {
        name: '',
        adventuring_class: '',
        xp: 0,
        level: function () {
            return $scope.levels.sort(function (a, b) {
                return b.level - a.level;
            }).find(function (lp) {
                return lp.min_xp <= $scope.character.xp;
            }).level
        }
    };
  });