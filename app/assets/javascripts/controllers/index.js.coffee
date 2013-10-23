LiveReader.IndexController = Ember.ArrayController.extend

  actions: ->
    goToDocument: (doc) ->
      this.transitionToRoute('document', doc)

  sortProperties: ['updated_at']
  sortAscending: false

  show: (doc) ->
    @hideAll()
    doc.set('selected', true)

  hideAll: ->
    @get('content').forEach (item) ->
      item.set('selected', null)

  # Computed properties ---------------------------------------

  # The currently selected/highlighted/clicked on document
  selectedDocument: (->
    @get('content').find (item) ->
      item.get('selected') == true
  ).property('@each.selected')

  # The active document is the most recent document
  activeDocument: (->
    @get('firstObject')
  ).property('firstObject')

  searchTermDidChange: (->
    @get('content').forEach (item) =>
      term = @get('searchTerm').replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&"); #Make it regex-safe

      if item.get('title').match( new RegExp(term, "i") )
        item.set('isVisible', true)
      else
        item.set('isVisible', false)
  ).observes('searchTerm')

  clearSearchTerm: ->
    @set('searchTerm', "")
