class Coven.Routers.Application extends Backbone.Router

  routes: ->
    '': 'home'

  home: ->
    console.log 'Welcome to Backbone'
