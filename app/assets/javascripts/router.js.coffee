# For more information see: http://emberjs.com/guides/routing/

LiveReader.Router.map ()->
  @resource 'documents',  { path: '/'         }
  this.route 'about'
  this.route 'events'
  this.route 'writers'

