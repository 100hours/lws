LiveReader.DocumentsShowController = Ember.ObjectController.extend
  needs: "documents"
  activeDocument: (->
    @controllerFor('documents').get('firstObject')
  ).property('controllers.documents.firstObject')
