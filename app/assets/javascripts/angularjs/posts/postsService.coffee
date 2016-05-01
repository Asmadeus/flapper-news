angular.module('FlapperNews.PostsModule')
  .factory('postsService',[
    '$http'
    ($http) ->
      posts = []
      post = {}
      getAll = ->
        $http.get('/posts.json').then(
          (response) ->
            angular.copy(response.data, posts)
        )

      createPost = (post) ->
        $http.post('/posts.json', post).then(
          (response) ->
            posts.push(response.data)
        )

      upvote = (post) ->
        $http.put('/posts/'+post.id+'/upvote.json').then(
          (response) ->
            post.upvotes++
        )

      upvoteComment = (post, comment) ->
        $http.put('/posts/'+post.id+'/comments/'+comment.id+'/upvote.json').then(
          (response) ->
            comment.upvotes++
        )

      getSingle = (id) ->
        $http.get('/posts/'+id+'.json').then(
          (response) ->
            angular.copy(response.data, post)
        )

      createComment = (postId, comment) ->
        $http.post('/posts/'+postId+'/comments.json',comment)

      posts: posts
      post: post
      getAll: getAll
      getSingle: getSingle
      createPost: createPost
      createComment: createComment
      upvote: upvote
      upvoteComment: upvoteComment
  ])
