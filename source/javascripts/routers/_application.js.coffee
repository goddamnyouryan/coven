class Coven.Routers.Application extends Backbone.Router

  initialize: ->
    new Coven.Views.Nav el: '.nav-toggle'
    new Coven.Views.Sources(el: 'ul.sources').render()
