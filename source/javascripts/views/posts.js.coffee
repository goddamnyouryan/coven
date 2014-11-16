class Coven.Views.Posts extends Backbone.View
  template: JST['templates/posts']

  initialize: ->
    @collection = new Coven.Collections.Posts

  render: ->
    @collection.fetch
      success: =>
        @renderPosts()
      failure: ->
        alert 'Something went wrong!'

  renderPosts: ->
    @$el.html @template(posts: @collection.models)
