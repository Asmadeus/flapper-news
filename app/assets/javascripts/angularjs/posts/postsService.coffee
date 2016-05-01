angular.module('FlapperNews.PostsModule')
  .factory('postsService',[
    ->
      posts = [
        {
          title: 'post1'
          upvotes: 1
          comments: [
            {
              author: 'John'
              text: 'first comment cool!!!!!!!'
              upvotes: 0
            }
          ]
        }
      ]
      return {
        posts: posts
      }
  ])
