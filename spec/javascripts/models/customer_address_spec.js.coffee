describe "CustomerAddress", ->
  beforeEach ->
    @customerAddress = new App.CustomerAddress()
  
  it "should have a base url", ->
    expect(@customerAddress.url()).toEqual "/addresses"
  
  it "should have a url for ID", ->
    @customerAddress.set
      id: 1
    expect(@customerAddress.url()).toEqual "/addresses/1.json"
    
  it "should save the Customer's Address to the server", ->
    fakeAjax registrations: [ 
      url: "/addresses/1.json"
      type: "put"
      successData:
        success: 201
    , 
      url: "/addresses/1.json"
      type: "post"
      successData:
        success: 201
    ]
    @customerAddress.set
      id: 1
    @customerAddress.save()
    expect(@customerAddress.get('success')).toBe 201