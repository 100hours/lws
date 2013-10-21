#= require jquery
#= require jquery_ujs
#= require jquery.browser
#= require bootstrap
#= require_self
#= require redactor

class Editor
  dirty: false
  snapshot:
    body: false
    title: false

  constructor: ->
    console.log("Initialising editor")
    @takeSnapshot()

  takeSnapshot: ->
    console.log("Taking snapshot of current text")
    @snapshot.body = @currentBody()
    @snapshot.title = @currentTitle()

  currentBody: ->
    $('#redactor').getCode()

  currentTitle: ->
    $('#document_title').val()

  textChanged: ->
    (@snapshot.body != @currentBody()) or (@snapshot.title != @currentTitle())

  countWords: (text) ->
    $('#redactor').getText().match(/\w+/g)?.length;

  updateWordCount: ->
    count = @countWords(@snapshot.body)
    $('#word_count').text("#{count} #{if count == 1 then "word" else "words"}")

  updateConnectionStatus: (text, label) ->
    $('#connection-status').attr("class", "label").html(text)
    if (label)
      $('#connection-status').addClass("label-" + label)

  update: ->
    if (@textChanged() and not @dirty)
      @dirty = true
      @takeSnapshot()
      @updateWordCount()
      @_save()

  _save: ->
    @takeSnapshot()
    form = $('form')
    @updateConnectionStatus("Saving...")
    $.ajax
      type: 'POST'
      url: form.attr('action')
      data: form.serialize()
      dataType: 'json'
      timeout: 5000
      success: (response) =>
        @updateConnectionStatus("Saved", "info")
        @dirty = false
      error: (response) =>
        @updateConnectionStatus("Failed to save", "warning")
        @dirty = false

@WriteRoom = {}

WriteRoom.register = (label, callback) ->
  WriteRoom.fragments = WriteRoom.fragments || {}
  WriteRoom.fragments[label] = callback

WriteRoom.require = (label, data) ->
  WriteRoom.fragments[label].call(window,data)

WriteRoom.register 'documents/edit', (data) ->
  console.log("Attaching redactor to view")
  $('#redactor').redactor()
  console.log("Initialising Editor instance")

  editor = new Editor

  editor.updateConnectionStatus("Ready!", "info")

  setInterval ->
    editor.update()
  , 500
