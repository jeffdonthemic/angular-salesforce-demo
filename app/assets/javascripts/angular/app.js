'use strict';
/*
    This is our main launch point from Angular. We'll put anything to do with the
    general well being of our app in this file. For now it'll basically just contain
    the routing information.

    Our module will be called 'app'.
 */
angular.module('app', ['ngResource'])
  .config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
    $routeProvider
      .when('/', {
        controller: 'AccountListCtrl', 
        templateUrl: '/assets/angular/templates/index.html'
      })
      .when('/accounts/:id', {
        controller: 'AccountDetailCtrl', 
        templateUrl: '/assets/angular/templates/details.html'
      })
      .otherwise({redirectTo: '/'});
}]);