class Coven.Views.Sources extends Backbone.View

  template: JST['templates/_sources']

  cookieName: '_coven_preferences'

  render: ->
    @$el.html @template(cookie: @cookie())
    @renderPosts()

  renderPosts: ->
    @posts = @posts || new Coven.Views.Posts(el: 'ul.posts', data: @cookie())
    @posts.render()

  events: ->
    'change input': 'updatePreferences'

  updatePreferences: (event) ->
    event.preventDefault()
    sources = _.map @$('input:checked'), (input) -> $(input).val()
    @setCookie(sources)
    @renderPosts()

  setCookie: (array) ->
    $.cookie(@cookieName, array)

  cookie: ->
    $.cookie(@cookieName)
