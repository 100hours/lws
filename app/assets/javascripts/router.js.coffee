# For more information see: http://emberjs.com/guides/routing/

LiveReader.Router.map ()->
  @resource 'documents'
  @resource 'document', { path: '/:document_id' }

