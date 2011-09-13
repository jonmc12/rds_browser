App.Views.WelcomeAddressForm = Backbone.View.extend
  events:
    "click ul.buildingIcons.container > li": "processBuildingIcons"
  
  processBuildingIcons: (obj) ->
    $('ul.addressForms.container > li > form').hide()
    $('ul.buildingIcons.container > li > a').removeClass('selected')
    $('li.'+$(obj.currentTarget).attr('form')+'Form.container > form').show "slow","easeInOutBack"
    $(obj.currentTarget).find('a').addClass('selected')
  # initialize: (args) ->
  #   if this.model
  #     this.model.bind 'change:state', this.changeState