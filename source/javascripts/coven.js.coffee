window.Coven =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Coven.Routers.Application
    Backbone.history.start pushState: Modernizr.history

$(document).ready ->
  Coven.initialize()
