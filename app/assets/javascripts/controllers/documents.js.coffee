LiveReader.DocumentsController = Ember.ArrayController.extend
  sortProperties: ['updated_at']
  sortAscending: false

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
