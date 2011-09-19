window.App =
	init: ->
	  window.app = {}
	  app.testShelfView = new App.Views.TestShelf()
	  app.customerOrderView = new App.Views.CustomerOrder()
	  app.header = new App.Views.Header( {el:$('header')} )
	  app.customerOrder = new App.CustomerOrder({ view:app.customerOrderView })
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
  pageUnits = 'px'
  colUnits = 'px'
  pagewidth = 896
  columns = 10
  columnwidth = 92
  gutterwidth = 24
  pagetopmargin = 35
  rowheight = 20
  makehugrid()
  setgridonload()
  

