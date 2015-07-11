class Coven.Views.Posts extends Backbone.View
  template: JST['templates/_posts']

  initialize: (options) ->
    @data = options.data
    @collection = new Coven.Collections.Posts

  render: ->
    @$el.empty()
    $('#container').removeClass 'loaded'
    @collection.fetch
      reset: true
      data: { sources: @data }
      success: =>
        @renderPosts()
      failure: ->
        alert 'Something went wrong!'

  renderPosts: ->
    @$el.html @template(posts: @collection.models)
    $('#container').addClass 'loaded'
