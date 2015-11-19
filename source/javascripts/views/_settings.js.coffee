class Coven.Views.Settings extends Backbone.View
  cookieName: '_coven_settings'

  render: ->
    _.each @model.attributes, (value, key) ->
      $('#settings-' + key).attr(checked: value)

  events: ->
    'change input': 'changeSettings'

  changeSettings: (event) ->
    @$('input').each _.bind((_, el) ->
      @model.set(el.id.replace('settings-', ''), $(el).is(':checked'))
    , @)

    @model.setCookie()
