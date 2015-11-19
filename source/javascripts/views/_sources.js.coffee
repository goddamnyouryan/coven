class Coven.Views.Sources extends Backbone.View

  template: JST['templates/_sources']

  cookieName: '_coven_preferences'

  initialize: (options) ->
    @posts = new Coven.Views.Posts(el: 'ul.posts', data: @cookie(), settings: options.settings).render()

  render: (options) ->
    @$el.html @template(cookie: @cookie())

  events: ->
    'change input': 'updatePreferences'

  updatePreferences: (event) ->
    event.preventDefault()
    sources = _.map @$('input:checked'), (input) -> $(input).val()
    @setCookie(sources)
    @posts.updateData(@cookie())
    @render()

  setCookie: (array) ->
    $.cookie(@cookieName, array)

  cookie: ->
    $.cookie(@cookieName)
