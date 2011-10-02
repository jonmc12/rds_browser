App.Views.CustomerOrder = Backbone.View.extend
  mapStates: (currentState) ->
    $('section').hide(); #rows
    $('section > ul > li').hide(); #columns
    $('section > ul > li > div').hide(); #rows in columns
    switch currentState.page
      when "header" then this.renderHeader currentState #TODO
      when "footer" then this.renderFooter currentState #TODO
      when "welcome" then this.renderWelcome currentState
      when "restaurants" then this.renderRestaurants currentState
      when "menuitems" then this.renderMenuItems currentState #TODO
      when "checkout" then this.renderCheckout currentState #TODO
      when "confirm" then this.renderConfirm currentState #TODO
  renderHeader: (state) ->
    switch state.goal
      when "select" then selectRestaurant
  showSections: (sections) ->
    for section in sections
      $(section).show();
  # Welcome #
  selectLoginForm: ->
    alert 'selectLoginForm'
  selectCreateAccountForm: ->
    alert 'selectCreateAccountForm'
    
  loginWithCredentials: ->
    alert 'loginWithCredentials'

  createAccount: ->
    alert 'createAccount'

  ## search restaurant ##
  renderWelcome: (state) ->
    sectionArray = [
      "section#featured" if "anonymous" is state.session
      "section#company" if "anonymous" is state.session
      "section#company > ul > li" if "anonymous" is state.session
      "section#company > ul > li > div" if "anonymous" is state.session
      "section#instructions" if "anonymous" is state.session
      "section#instructions > ul > li" if "anonymous" is state.session
      "section#instructions > ul > li > div" if "anonymous" is state.session
      "section#newProduct" if "anonymous" is state.session 
      "section#newProduct > ul > li" if "anonymous" is state.session
      "section#newProduct > ul > li > div" if "anonymous" is state.session
      "section#"+state.attributes.filter[0]+"Form" if state.attributes.filter[0] in ["address","franchise"]
      "section#"+state.attributes.filter[0]+"Form > ul" if state.attributes.filter[0] in ["address","franchise"]
      "section#"+state.attributes.filter[0]+"Form > ul > li" if state.attributes.filter[0] in ["address","franchise"]
      "section#recentOrders" if "orders" in state.attributes.objects
      "section#recentOrders > ul" if "orders" in state.attributes.objects
      "section#recentOrders > ul > li" if "orders" in state.attributes.objects
    ]
    this.showSections(sectionArray)

  viewHelp:
    welcome: ->
      alert 'viewHelp'
    restaurants: ->
      alert 'viewHelp'
    menuitems: ->
      alert 'viewHelp'

  # Restaurants #
  ## select restaurant ##
  renderRestaurants: (state) ->
    switch state.goal
      when "select" then this.selectRestaurant state
  selectRestaurant: (state)->
    sectionArray = [
      "section#restaurantSearchHeader",
      "li#cuisineSearch", "li#cuisineFacets",
      "section#restaurantSelector",
      "li#restaurant"+this.capitalizeFirst(state.attributes.format[0])
    ]
    contents = this.generateRestaurantSelectDomContents state
    for content in contents
      sectionArray.push(content)
    this.showSections(sectionArray)

  generateRestaurantSelectDomContents: (state) ->
    if state.attributes.context.length == 1
      return ['li#restaurantsArrow']
    else
      domElements = for element in state.attributes.context
        'div#restaurant'+this.capitalizeFirst(element)
      domElements.push('li.restaurantInfo.contain')
      return domElements
      
  #menuitems
  selectMenuItem: (contents) ->
    sectionArray = []
    for content in contents
      sectionArray.push(content)
    this.showSections(sectionArray)
  
  selectByRestaurant: ->
    this.selectMenuItem([
      'section#menuHeader'
      'li#restaurantLogo', 'li#restaurantInfo','li.menuTab.container'
      'li.menuTab.container > div'
      'section#menuSelector'
      'li#restaurantMenu','li#menuCart'
      'li#restaurantMenu > div'  
    ])
  
  selectByRestaurantWithFullCart: ->
    this.selectMenuItem([
      'section#menuHeader'
      'li#restaurantLogo', 'li#restaurantInfo','li.menuTab.container'
      'li.menuTab.container > div'
      'section#menuSelector'
      'li#restaurantMenu','li#menuCartFull'
      'li#restaurantMenu > div'  
    ])
  
  viewRestaurantInfo: ->
    this.selectMenuItem([
      'section#menuHeader'
      'li#restaurantLogo', 'li#restaurantInfo','li.menuTab.container'
      'li.menuTab.container > div'
      'section#restaurantInfo'
      'li#restaurantDescription','li#orderingInfo'
      'li#restaurantDescription > div', 'li#orderingInfo > div'
    ])
    
  selectMenuItemOptions: ->
    alert 'selectByPreviewWithCart'

  #checkout
  inputDeliveryAndPaymentInformation: ->
    alert 'inputDeliveryAndPaymentInformation'

  #confirm
  selectOrderPurchaseConfirmation: ->
    alert 'selectOrderPurchaseConfirmation'


  capitalizeFirst:(string) ->
    string.charAt(0).toUpperCase() + string.slice(1);