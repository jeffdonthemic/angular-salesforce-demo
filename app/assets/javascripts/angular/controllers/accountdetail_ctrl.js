'use strict';

var app = angular.module('app');

app.controller('AccountDetailCtrl', function($scope, $routeParams, Account) {

  $scope.account = Account.get({id:$routeParams.id});
  $scope.mode = 'display';

  $scope.edit = function(account) {
    $scope.mode = 'edit'; 
  }

  $scope.cancel = function() {
    $scope.mode = 'display'; 
  }  

});