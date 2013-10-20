App.DocumentsRoute = Ember.Route.extend
  model: ->
    @get('store').findAll('document')
