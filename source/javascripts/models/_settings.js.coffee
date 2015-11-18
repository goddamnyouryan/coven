class Coven.Models.Settings extends Backbone.Model
  cookieName: '_coven_settings'

  defaults:
    auto_update: false

  initialize: ->
    _.each(JSON.parse(@cookie() || '{}'), (value, key) ->
      @set key, value
    , @)

  setCookie: ->
    $.cookie(@cookieName, JSON.stringify(@attributes))

  cookie: ->
    $.cookie(@cookieName)
