window.App =
	init: ->
	  window.app = {}
	  app.customerOrderView = new App.Views.CustomerOrder()
	  app.customerOrder = new App.CustomerOrder({ view:app.customerOrderView })
	  app.customerOrderRouter = new App.Routers.CustomerOrder()
	  Backbone.history.start()
	  app.welcomeAddressForm = new App.Views.WelcomeAddressForm( {el:$('section#addressForm')} )
	  app.defaultState = 
	    "anonymous":
        "welcome":
          "query":
            objects:  ["restaurants"]
            filter:   ["address"]
            context:  []
            format:   ["form"]
    app.customerOrder.set 
      state:app.defaultState
      view:app.customerOrderView
    $('li.houseIcon.container').click()

# App Classes
App.Views = {}
App.Routers = {}
App.Collections = {}

$(document).ready ->
  App.init()
  Guiders.init()
  

