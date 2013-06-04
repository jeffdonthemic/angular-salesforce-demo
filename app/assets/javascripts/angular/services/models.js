'use strict';

var app = angular.module('app');

app.factory('Account', ['$resource', function($resource) {
    return $resource('/accounts/:id', {id: '@id'}, {update: {method: "PUT"}});
}]);