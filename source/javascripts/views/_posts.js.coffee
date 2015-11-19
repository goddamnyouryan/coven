class Coven.Views.Posts extends Backbone.View
  template: JST['templates/_posts']

  _auto_update_timeout: null
  _auto_update_frequency: 3600000 # 1 hour

  initialize: (options) ->
    @settings = options.settings
    @data = options.data
    @collection = new Coven.Collections.Posts

    @listenTo(@settings, 'change auto_update', @scheduleAutoUpdate)

  render: ->
    @$el.empty()
    $('#container').removeClass 'loaded'

    @collection.fetch
      reset: true
      data: { sources: @data }
      success: =>
        @scheduleAutoUpdate()
        @renderPosts()
      failure: ->
        @scheduleAutoUpdate()
        alert 'Something went wrong!'

    return @

  renderPosts: ->
    @$el.html @template(posts: @collection.models)
    $('#container').addClass 'loaded'

  updateData: (data) ->
    @data = data
    @render()

  scheduleAutoUpdate: ->
    clearTimeout @_auto_update_timeout

    if @settings.get('auto_update')
      @_auto_update_timeout = setTimeout(_.bind(@render, @), @_auto_update_frequency)

