LiveReader.IndexRoute = Ember.Route.extend
  redirect: () ->
    @transitionTo 'documents.index'
 
