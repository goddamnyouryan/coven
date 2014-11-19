class Coven.Views.Posts extends Backbone.View
  template: JST['templates/posts']

  initialize: (options) ->
    @data = options.data
    @collection = new Coven.Collections.Posts

  render: ->
    @collection.fetch
      data: { sources: @data }
      success: =>
        @renderPosts()
      failure: ->
        alert 'Something went wrong!'

  renderPosts: ->
    @$el.html @template(posts: @collection.models)
