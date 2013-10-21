#= require jquery
#= require jquery_ujs
#= require jquery.browser
#= require handlebars
#= require ember-canary
#= require ember-data-canary
#= require bootstrap
#= require_self
#= require app

@LiveReader = Ember.Application.create
  rootElement: "#viewer"
# for more details see: http://emberjs.com/guides/application/
#= require_tree .
