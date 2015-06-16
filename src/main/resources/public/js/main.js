var app = angular.module("mmorpgApp", ["ui.router"]);

app.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
    $stateProvider
        .state('home', {
            url: '/home',
            templateUrl: '/pages/home.html',
            controller: 'HomeCtrl'
        })
        .state('user', {
            url: '/user',
            templateUrl: '/pages/user.html',
            controller: 'UserCtrl'
        })
        .state('admin', {
            url: '/admin',
            templateUrl: '/pages/admin.html',
            controller: 'AdminCtrl'
        });
    $urlRouterProvider.otherwise('home');
}]);

app.controller('HomeCtrl', ['$scope', function($scope) {
    $scope.hola = ";)";
}]);

app.controller('UserCtrl', ['$scope', function($scope) {
    $scope.hola = ";)";
}]);

app.controller('AdminCtrl', ['$scope', function($scope) {
    $scope.hola = ";)";
}]);
