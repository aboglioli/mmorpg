app.factory('cuenta', ['$http', function($http) {
    var o = {
        cuenta: {
            usuario: '',
            email: ''
        }
    };
    o.ingresar = function(cuenta) {
        return $http.post('/cuenta/ingresar', cuenta).success(function(data) {
            console.log(data);
            angular.copy(data, o.cuenta);
        });
    }
    o.crear = function(cuenta) {
        return $http.post('/cuenta/crear', cuenta).success(function(data) {
            console.log(data);
            angular.copy(data, o.cuenta);
        });
    }

    return o;
}]);

app.controller('UserCtrl', ['$scope', 'cuenta', function($scope, cuenta) {
    $scope.cuenta = cuenta.cuenta;
    $scope.ingresarCuenta = function() {
        cuenta.ingresar({usuario: $scope.usuario, email: $scope.email, contrasenia: $scope.contrasenia});
    }
}]);
