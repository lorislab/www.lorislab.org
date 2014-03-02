'use strict';

var app = angular.module('lorislab', [
	'ngRoute',
	'lorislab.filters',
	'lorislab.services',
	'lorislab.directives',
	'lorislab.controllers'
]);

app.config(['$routeProvider', function($routeProvider) {
		$routeProvider.when('/projects', {templateUrl: 'partials/projects.html', controller: 'ProjectsCtrl'});
		$routeProvider.when('/armonitor', {templateUrl: 'projects/armonitor/index.html', controller: 'ARMonitorCtrl'});
		$routeProvider.when('/smonitor', {templateUrl: 'projects/smonitor/index.html', controller: 'SMonitorCtrl'});
		$routeProvider.when('/contact', {templateUrl: 'partials/contact.html', controller: 'ContactCtrl'});
		$routeProvider.otherwise({redirectTo: '/projects'});
	}]);

/* Services */
angular.module('lorislab.services', []);

/* Filters */
angular.module('lorislab.filters', []);

/* Directives */
angular.module('lorislab.directives', []);
 
/* Controllers */
angular.module('lorislab.controllers', [])
		.controller('ProjectsCtrl', function($scope) {

		})
		.controller('ContactCtrl', function($scope) {
			$scope.email = function() {
				return "team@lorislab.org";
			};
		})
		.controller('ARMonitorCtrl', function($scope, $location, $anchorScroll) {
			$scope.version = "0.0.1";
			$scope.scrollTo = function(id) {
			   $location.hash(id);
			   $anchorScroll();
			};	
		})
		.controller('SMonitorCtrl', function($scope) {
			
		})
		.controller('MenuCtrl', function($scope, $location) {

			$scope.active = function(data) {
				var tmp = $location.path();
				var r = false;
				for (var i = 0; i < data.length && !r; i++) {
					r = (tmp.indexOf(data[i]) === 0);
				}
				return r;
			};
		});