class Coven.Views.Sources extends Backbone.View

  template: JST['templates/sources']

  cookieName: '_coven_preferences'

  render: ->
    @posts = new Coven.Views.Posts(el: 'ul.posts', data: @cookie())
    @posts.render()
    @$el.html @template(cookie: @cookie())

  events: ->
    'change input': 'updatePreferences'

  updatePreferences: (event) ->
    event.preventDefault()
    sources = _.map @$('input:checked'), (input) -> $(input).val()
    @setCookie(sources)
    @render()

  setCookie: (array) ->
    $.cookie(@cookieName, array)

  cookie: ->
    $.cookie(@cookieName)
