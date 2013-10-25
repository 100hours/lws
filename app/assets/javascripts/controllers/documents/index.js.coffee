LiveReader.DocumentsIndexController = Ember.ArrayController.extend
  sortProperties: ['updated_at']
  sortAscending: false
  activeDocument: (->
    @get('firstObject')
  ).property('firstObject')
