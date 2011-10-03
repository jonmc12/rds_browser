window.App =
	init: ->
	  window.app = {}
	  app.testShelfView = new App.Views.TestShelf()
	  app.customerOrderView = new App.Views.CustomerOrder()
	  app.header = new App.Views.Header( {el:$('header')} )
	  app.customerOrder = new App.CustomerOrder({ view:app.customerOrderView })
	  app.customerAddress = new App.CustomerAddress()
	  app.customerOrderRouter = new App.Routers.CustomerOrder()
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
  Backbone.history.start(pushState: true, root: '/')
  # Heads up grid settings
  window.pageUnits = 'px'
  window.colUnits = 'px'
  window.pagewidth = 992
  window.columns = 10
  window.columnwidth = 92
  window.gutterwidth = 8
  window.pagetopmargin = 35
  window.rowheight = 30
  makehugrid()
  setgridonload()
  

