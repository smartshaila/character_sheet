//= require angular/angular
//= require angular-aria/angular-aria
//= require angular-animate/angular-animate
//= require angular-material/angular-material

atmlApp = angular
  .module('atmlApp',['ngMaterial'])
  .controller('atmlCtrl', function($scope, $http){
    $scope.classes = [];
    $http.get('classes.json').then(function (value) { $scope.classes = value.data; });
    $scope.character = {name: '', adventuring_class: ''};
  });