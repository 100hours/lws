LiveReader.DocumentsShowController = Ember.ObjectController.extend
  activeDocument: (->
    @controllerFor('documents').get('firstObject')
  ).property('firstObject')
