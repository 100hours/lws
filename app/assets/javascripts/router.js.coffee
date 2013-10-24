# For more information see: http://emberjs.com/guides/routing/

LiveReader.Router.map () ->
  @resource 'documents', { path: '/' }, ->
    @route 'index', { path: "/" },
    @route 'show', { path: '/:document_id' }

