LiveReader.DocumentRoute = Ember.Route.extend
  model: ->
    this.store.findModel('document', params['document_id'])
