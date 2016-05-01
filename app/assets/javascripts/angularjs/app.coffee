angular.module('FlapperNews',[
  'FlapperNews.PostsModule'
  'templates'
  'ngRoute'
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
  ).otherwise redirectTo: '/'
])

angular.module('FlapperNews.PostsModule',[])
