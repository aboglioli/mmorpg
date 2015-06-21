app.factory('cuenta', ['$http', function($http) {
    var o = {
        cuenta : {
            usuario: '',
            email: ''
        },
        jugadores: []
    };
    o.getCuenta = function(cuenta) {
        return $http.post('/cuenta/ingresar', cuenta).success(function(data) {
            console.log(data);
            if(data.msg == null) {
                angular.copy(data, o.cuenta);
                o.getJugadores();
            } else {
                alert(data.msg);
            }
        });
    }
    o.setCuenta = function(cuenta) {
        return $http.post('/cuenta/crear', cuenta).success(function(data) {
            console.log(data);
            if(data.msg == null) {
                angular.copy(data, o.cuenta);
            } else {
                alert(data.msg);
            }
        });
    }
    o.getJugadores = function() {
        return $http.get('/jugadores/').success(function(data) {
            console.log(data);
            if(data.msg == null) {
                angular.copy(data, o.jugadores);
            } else {
                alert(data.msg);
            }
        });
    }
    o.setJugador = function(jugador) {
        return $http.post('/jugador', jugador).success(function(data) {
            console.log(data);
            if(data.msg == null) {
                o.jugadores.push(data);
            } else {
                alert(data.msg);
            }
        });
    }

    return o;
}]);

app.controller('UserCtrl', ['$scope', 'cuenta', function($scope, cuenta) {
    $scope.cuenta = cuenta.cuenta;
    $scope.jugadores = cuenta.jugadores;

    $scope.crearCuenta = function() {
        cuenta.setCuenta({usuario: $scope.cr_usuario, email: $scope.cr_email, contrasenia: $scope.cr_contrasenia});
    }
    $scope.ingresarCuenta = function() {
        cuenta.getCuenta({usuario: $scope.ing_usuario, contrasenia: $scope.ing_contrasenia});
    }
    $scope.crearJugador = function() {
        cuenta.setJugador({usuario: cuenta.cuenta.usuario, nombre: $scope.cr_nombre, clase: $scope.cr_clase});
        $scope.cr_nombre = '';
        $scope.cr_clase = '';
    }
}]);
