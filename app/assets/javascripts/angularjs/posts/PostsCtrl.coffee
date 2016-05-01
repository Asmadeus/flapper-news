angular.module('FlapperNews.PostsModule')
  .controller('PostsCtrl',[
    '$scope'
    '$routeParams'
    'postsService'
    ($scope,$routeParams,postsService) ->
      postsService.getSingle($routeParams.postId)
      $scope.post = postsService.post
      $scope.addComment = ->
        if !$scope.text || $scope.text == ''
          return
        postsService.createComment(
          $scope.post.id
          text: $scope.text
          author: 'user'
        ).then(
          (response) ->
            $scope.post.comments.push(response.data)
        )
        $scope.text = ''

      $scope.incrementUpvotes = (comment) ->
        postsService.upvoteComment($scope.post, comment)
  ])
