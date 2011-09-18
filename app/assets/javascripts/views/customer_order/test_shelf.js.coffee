App.Views.TestShelf = Backbone.View.extend
  el: 'div#testShelf'
  events:
    "click ul > li > div": "processTestLinks"
  
  processTestLinks: (obj) ->
    app.customerOrderRouter.navigate($(obj.currentTarget).attr('route'), true);