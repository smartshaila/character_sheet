#//= require angular/angular
#//= require angular-aria/angular-aria
#//= require angular-animate/angular-animate
#//= require angular-material/angular-material

atmlApp = angular
  .module('atmlApp',['ngMaterial'])
  .controller('atmlCtrl', function($scope){
    $scope.user = {name: ''};
  });
