App.CustomerOrder = Backbone.Model.extend
  name: "customer_order"
  # <session>_<pageContent>_<userGoal>_<elementType>
  states:
    "all":  # reserved for pages that are persistently present, whose state does not impact other states
      "header":
        "select":
          objects:  ["sessionForm", "userForm", "restaurantsForm", "ordersList"]
          filter:   ["address", "franchise"]
          context:  ["orderHistory"]
          format:   ["tab", "link"]
        "input":
          objects:  ["user","session"]
          filter:   []
          context:  []
          format:   ["form"]
      "footer":
        "view":
          objects:  []
          filter:   []
          context:  []
          format:   []
    "session":
      "welcome":
        "query":
          objects:  ["addressForm"]
          filter:   ["address", "franchise"]
          context:  ["buildingType","addressHistory"]
          format:   ["form"]
        "select":
          objects:  ["orders"]
          filter:   ["recentHistory"]
          context:  ["orderHistory"]
          format:   ["list"]
        "view": 
          objects:  ["welcomeHelp"]
          filter:   []
          context:  ["help"]
          format:   ["modal"]
      "restaurants":
        "select":
          objects:  ["restaurants"]
          filter:   ["address", "franchise"]
          context:  ["info", "previewMenu", "cart"]
          format:   ["list", "gallery"]
        "view":
          objects:  ["restaurantHelp"]
          filter:   []
          context:  ["help"]
          format:   ["modal"]
      "menuitems":
        "select":
          objects:  ["menuItems", "menuItemOptions"]
          filter:   ["restaurant","menuItem"]
          context:  ["emptyCart","fullCart"]
          format:   ["list", "modal"]
        "view":
          objects:  ["menuItemHelp"]
          filter:   []
          context:  ["help"]
          format:   ["modal"]
      "checkout":
        "input":
          objects:  ["user", "address", "payment"]
          filter:   ["user"]
          context:  ["orderDetails"]
          format:   ["form"]
        "view":
          objects:  ["checkoutHelp"]
          filter:   []
          context:  ["help"]
          format:   ["modal"]
      "confirm":
        "select":
          objects:  ["order"]
          filter:   ["user"]
          context:  ["orderDetails"]
          format:   ["form"]
        "view":
          objects:  ["confirmHelp"]
          filter:   []
          context:  ["help"]
          format:   ["modal"]
    "anonymous":
      "welcome":
        "query":
          objects:  ["addressForm"]
          filter:   ["address", "franchise"]
          context:  ["buildingType"]
          format:   ["form"]
        "view": 
          objects:  ["welcomeHelp"]
          filter:   []
          context:  ["help"]
          format:   ["modal"]
      "restaurants":
        "select":
          objects:  ["restaurants"]
          filter:   ["address", "franchise"]
          context:  ["info", "previewMenu", "cart"]
          format:   ["list", "gallery"]
        "view":
          objects:  ["restaurantHelp"]
          filter:   []
          context:  ["help"]
          format:   ["modal"]
      "menuitems":
        "select":
          objects:  ["menuItems", "menuItemOptions"]
          filter:   ["restaurant","menuItem"]
          context:  ["emptyCart","fullCart"]
          format:   ["list", "modal"]
        "view":
          objects:  ["menuItemHelp"]
          filter:   []
          context:  ["help"]
          format:   ["modal"]
      "checkout":
        "input":
          objects:  ["user", "address", "payment"]
          filter:   ["user"]
          context:  ["orderDetails"]
          format:   ["form"]
        "view":
          objects:  ["checkoutHelp"]
          filter:   []
          context:  ["help"]
          format:   ["modal"]
      "confirm":
        "select":
          objects:  ["order"]
          filter:   ["user"]
          context:  ["orderDetails"]
          format:   ["form"]
        "view":
          objects:  ["confirmHelp"]
          filter:   []
          context:  ["help"]
          format:   ["modal"]

  initialize: (args) ->
    this.bind 'change:state', (model, state) ->
      app.customerOrderView.mapStates(this.getState())
    
  renderFront: ->
  
  getState: ->
    session = this.getSessionState()
    page = this.getPageState(session)
    goal = this.getUserGoal(session, page)
    returnHash =
      session: session
      page: page
      goal: goal
      attributes: this.get('state')[session][page][goal]
  getSessionState: ->
    for session in ["all","session","anonymous"]
      return session if this.get('state')[session]
  getPageState: (sessionState)->
    for page in ["header","footer","welcome","restaurants","menuitems","checkout","confirm"]
      return page if this.get('state')[sessionState][page]
  getUserGoal: (sessionState,pageState) ->
    for goal in ["select","query","input","view"]
      return goal if this.get('state')[sessionState][pageState][goal]
    
  #     
  #   processSession(this.get('state').session) if state.session
  #   processAnonymous(state.anonymous) if state.anonymous
  # processSession: (stateSession) ->
  #   processWelcome('session', stateSession.welcome) if stateSession.welcome
  #   processRestaurants('session', stateSession.restaurants) if stateSession.restaurants
  #   processMenuItems('session', stateSession.menuitems) if stateSession.menuitems
  #   processCheckout('session', stateSession.checkout) if stateSession.checkout
  #   processConfirm('session', stateSession.confirm) if stateSession.confirm
  
  # transition: (futureState) ->
    # currentStateHash = $.zip(["session","pageContent","userGoal"], this.get('state').split("."))
    # futureStateHash = $.zip(["session","pageContent","userGoal"], futureState.split("."))
    #this.set({state: futureState}) # if this.view[currentStateHash.userGoal]()

  
  

    