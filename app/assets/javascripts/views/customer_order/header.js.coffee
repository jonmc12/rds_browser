App.Views.Header = Backbone.View.extend
  events:
    "click ul.orderTabs.container > li": "processHeaderTabs"
  
  processHeaderTabs: (obj) ->
    app.customerOrderRouter.navigate( $(obj.currentTarget).attr('route'), true )

  initGuider: ->
    guider.createGuider
      buttons: [
        {name: "Next"},{name:"Close", onclick: guider.hideAll}
        {name: "Feature:Login", onclick:Guiders.showLoginGuider}
        {name: "Feature:Create Account", onclick:Guiders.showLoginGuider}
        {name: "Feature:Chat", onclick:Guiders.showChatGuider}
        {name: "Feature:Restaurants by Address", onclick:Guiders.showRestaurantsByAddressGuider}
        {name: "Feature:Restaurants by Franchise", onclick:Guiders.showRestaurantsByFranchiseGuider}
        {name: "Feature:Order History", onclick:Guiders.showOrderHistoryGuider}
      ],
      description: $('body > header > div.help.container').html()
      id: "header_first"
      next: "header_second"
      overlay: true
      title: "Mr Delivery Frontpage Header!"
      width: 600
    
    guider.createGuider
      attachTo: "ul.userLinks.container"
      buttons: [{name: "Test:Login"},{name: "Test:Create Account"},{name: "Next"},{name:"Close", onclick: guider.hideAll}]
      description: "<pre>"+$('ul.userLinks.container > div.help.container').html()+"</pre>"
      id: "header_second"
      next: "header_third"
      position: 5
      title: "Login and Create Account"
      width: 600
    
    guider.createGuider
      attachTo: "div.chatButton.container"
      buttons: [{name: "Test:Login"},{name: "Test:Chat", onclick:Guiders.showChatGuider},{name: "Next"},{name:"Close", onclick: guider.hideAll}]
      description: "<pre>"+$('div.chatButton.container > div.help.container').html()+"</pre>"
      id: "header_third"
      next: "header_fourth"
      position: 5
      title: "Chat with Customer Service"
      width: 600
    
    guider.createGuider
      attachTo: "li.restaurantByAddress.container"
      buttons: [{name: "Test:Restaurants by Address",onclick:Guiders.showRestaurantsByAddressGuider},{name: "Next"},{name:"Close", onclick: guider.hideAll}]
      description: "<pre>"+$('li.restaurantByAddress.container > div.help.container').html()+"</pre>"
      id: "header_fourth"
      next: "header_fifth"
      position: 5
      title: "Restaurants by Address"
      width: 400
    
    guider.createGuider
      attachTo: "li.restaurantByFranchise.container"
      buttons: [{name: "Test:Restaurants by Franchise",onclick:Guiders.showRestaurantsByFranchiseGuider},{name: "Next"},{name:"Close", onclick: guider.hideAll}]
      description: "<pre>"+$('li.restaurantByFranchise.container > div.help.container').html()+"</pre>"
      id: "header_fifth"
      next: "header_sixth"
      position: 5
      title: "Restaurants by Franchise"
      width: 400
    
    guider.createGuider
      attachTo: "li.orderHistory.container"
      buttons: [{name: "Test:Order History",onclick:Guiders.showOrderHistoryGuider},{name: "Next"},{name:"Close", onclick: guider.hideAll}]
      description: "<pre>"+$('li.orderHistory.container > div.help.container').html()+"</pre>"
      id: "header_sixth"
      next: "header_seventh"
      position: 5
      title: "Order History"
      width: 400