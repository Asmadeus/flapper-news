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
          (response) ->
            console.log response
        )

      createPost = (post) ->
        $http.post('/posts.json', post).then(
          (response) ->
            posts.push(response.data)
          (response) ->
            console.log response
        )

      upvote = (post) ->
        $http.put('/posts/'+post.id+'/upvote.json').then(
          (response) ->
            post.upvotes++
          (response) ->
            console.log response
        )

      upvoteComment = (post, comment) ->
        $http.put('/posts/'+post.id+'/comments/'+comment.id+'/upvote.json').then(
          (response) ->
            comment.upvotes++
          (response) ->
            console.log response
        )

      getSingle = (id) ->
        $http.get('/posts/'+id+'.json').then(
          (response) ->
            angular.copy(response.data, post)
          (response) ->
            console.log response
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
