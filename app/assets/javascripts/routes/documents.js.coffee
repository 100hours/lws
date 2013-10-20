App.DocumentsRoute = Ember.Route.extend
  model: ->
    this.store.findAll('document')
