angular.module('FlapperNews')
  .controller('AuthCtrl',[
    '$scope'
    '$location'
    'Auth'
    ($scope,$location,Auth) ->
      $scope.login = ->
        Auth.login($scope.user).then(
          ->
            $location.path('/')
        )

      $scope.register = ->
        Auth.register($scope.user).then(
          ->
            $location.path('/')
        )

      Auth.currentUser().then(
        ->
          $location.path('/')
      )
  ])
