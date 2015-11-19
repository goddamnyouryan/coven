class Coven.Routers.Application extends Backbone.Router

  initialize: ->
    settings = new Coven.Models.Settings

    new Coven.Views.Nav el: '.nav-toggle'
    new Coven.Views.Sources(settings: settings, el: 'ul.sources').render()
    new Coven.Views.Settings(model: settings, el: 'ul.settings').render()
