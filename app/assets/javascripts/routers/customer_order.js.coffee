App.Routers.CustomerOrder = Backbone.Router.extend
  routes:
    ""                                    :   "index",
    "orderHistory"                        :   "renderOrderHistory"
    "franchises/:id/restaurants"          :   "franchiseRestaurants"
    "franchises/:id/restaurants/address/:address"    :   "franchiseRestaurants"
    "restaurants/:id"                     :   "restaurant"
    "restaurants/:filter/form"            :   "queryRestaurants"
    ":object/:filter/:context/:format"    :   "select"
    
  index: ->
    
  franchiseRestaurants: (id, address) ->
    if address
      alert('address - '+address)
    else
      alert('success! - '+id)
  
  restaurant: (id) ->
    alert('restaurant - '+id)
  
  queryRestaurants: (filter)->
    queryState = 
      "anonymous":
        "welcome":
          "query":
            objects:  ["restaurants"]
            filter:   [filter]
            context:  []
            format:   ["form"]
    app.customerOrder.set( {state: queryState} )
  
  select: (objectName, filter, context, format) ->
    if context.indexOf("+") != -1
      context = context.split('+')
    select =
      "select":
        objects:  [objectName]
        filter:   [filter]
        context:  if context instanceof Array then context else [context]
        format:   [format]
    selectState = {}
    selectState['anonymous'] = {}    
    selectState['anonymous'][objectName] = select
    app.customerOrder.set( {state:selectState} )
    
    
  #selectRestaurants
    # <div><a href="javascript:customerOrder.set({state:'anonymous.restaurants.selectWithInfo.list'})">[List]</a></div>
    # <div><a href="javascript:customerOrder.set({state:'anonymous.restaurants.selectWithInfo.gallery'})">[Gallery]</a></div>
    