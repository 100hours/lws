LiveReader.IndexRoute = Ember.Route.extend
  model: ->
    this.store.findAll('document')
