class Coven.Views.Sources extends Backbone.View

  template: JST['templates/sources']

  initialize: ->
    @posts = new Coven.Views.Posts(el: 'ul.posts')
    @posts.render()

  render: ->
    @$el.html @template()
