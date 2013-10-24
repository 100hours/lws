LiveReader.DocumentsIndexController = Ember.ArrayController.extend
  activeDocument: (->
    @get('firstObject')
  ).property('firstObject')
