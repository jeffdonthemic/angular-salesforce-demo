app = angular.module('Demo',['ngResource'])

app.factory "Account", ($resource) ->
	$resource('/accounts/:id', {id: "@id"}, {update: {method: "PUT"}})

@DemoCtrl = ($scope, Account) ->
	$scope.accounts = Account.query()

	$scope.addAccount = ->
		$scope.accounts.push($scope.newAccount)
		$scope.newAccount = {}