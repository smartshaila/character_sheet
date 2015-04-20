//= require angular/angular
//= require angular-aria/angular-aria
//= require angular-animate/angular-animate
//= require angular-material/angular-material

atmlApp = angular
  .module('atmlApp',['ngMaterial'])
  .controller('atmlCtrl', function($scope, $http){
    $http.get('classes.json').
        success(function(data) {
            $scope.classes = data;
        });
    $scope.character = {name: ''};
  });

