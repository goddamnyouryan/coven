class Coven.Collections.Posts extends Backbone.Collection
  model: Coven.Models.Post

  url: -> "#{Coven.Constants.API_ROOT}/posts"
