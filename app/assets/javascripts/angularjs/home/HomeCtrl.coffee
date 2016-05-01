angular.module('FlapperNews')
  .controller('HomeCtrl',[
    '$scope'
    'postsService'
    ($scope, postsService) ->
      postsService.getAll()
      $scope.posts = postsService.posts
      $scope.addPost = ->
        if $scope.title == '' || !$scope.title
          return
        postsService.createPost(
          title: $scope.title
        )
        $scope.title = ''
        return
      $scope.incrementUpvotes = (post) ->
        postsService.upvote(post)
  ])
