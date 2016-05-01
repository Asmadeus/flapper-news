angular.module('FlapperNews')
  .controller('HomeCtrl',[
    '$scope'
    'postsService'
    ($scope, postsService) ->
      $scope.posts = postsService.posts
      $scope.addPost = ->
        if $scope.title == '' || !$scope.title
          return
        $scope.posts.push(
          title: $scope.title
          upvotes: 0
        )
        $scope.title = ''
        return
      $scope.incrementUpvotes = (post) ->
        post.upvotes++
  ])
