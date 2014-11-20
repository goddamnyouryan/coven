class Coven.Views.Nav extends Backbone.View

  events: ->
    'click': 'toggleMenu'

  toggleMenu: (event) ->
    event.preventDefault()
    @content().toggleClass 'menu-open'

  content: ->
    $('#container')
