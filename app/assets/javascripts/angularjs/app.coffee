angular.module('FlapperNews',[
  'FlapperNews.PostsModule'
  'templates'
  'ngRoute'
  'Devise'
])
.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when(
    '/'
    controller: 'HomeCtrl'
    templateUrl: 'angularjs/home/home.html'
  ).when(
    '/posts/:postId'
    templateUrl: 'angularjs/posts/posts.html'
    controller: 'PostsCtrl'
  ).when(
    '/login'
    templateUrl: 'angularjs/auth/login.html'
    controller: 'AuthCtrl'
  ).when(
    '/register'
    templateUrl: 'angularjs/auth/register.html'
    controller: 'AuthCtrl'
  ).otherwise redirectTo: '/'
])

angular.module('FlapperNews.PostsModule',[])
