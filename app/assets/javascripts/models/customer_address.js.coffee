App.CustomerAddress = Backbone.Model.extend
  name: "customer_address"
  url: ->
	  base = '/addresses'
	  return base if this.isNew()
	  return base + if base.charAt(base.length - 1) == '/' then '' else '/' + this.id + '.json'
  