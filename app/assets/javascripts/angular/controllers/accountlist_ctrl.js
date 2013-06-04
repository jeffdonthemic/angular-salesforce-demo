'use strict';

var app = angular.module('app');

app.controller('AccountListCtrl', function($scope, Account) {
  $scope.accounts = Account.query();

  $scope.add = function() {
    var account = new Account({name:$scope.newAccount.name});
    account.$save(function() {
      $scope.accounts.push(account)
      $scope.newAccount = {}
    });
  }  
});