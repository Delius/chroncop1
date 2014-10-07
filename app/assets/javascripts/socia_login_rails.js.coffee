window.SociaLoginRails =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
   new Painmanager.Routes.Entries()
   Backbone.history.start()

$(document).ready ->
  SociaLoginRails.initialize()
