LiveReader.DocumentsIndexRoute = Ember.Route.extend
  model: (params) ->
    @modelFor('documents')
