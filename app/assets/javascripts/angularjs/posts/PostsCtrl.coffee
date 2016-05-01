angular.module('FlapperNews.PostsModule')
  .controller('PostsCtrl',[
    '$scope'
    '$routeParams'
    'postsService'
    ($scope,$routeParams,postsService) ->
      $scope.post = postsService.posts[$routeParams.postId]
      $scope.addComment = ->
        if !$scope.text || $scope.text == ''
          return
        $scope.post.comments.push(
          author: 'John'
          text: $scope.text
          upvotes: 0
        )
        $scope.text = ''
      $scope.incrementUpvotes = (comment) ->
        comment.upvotes++
  ])
