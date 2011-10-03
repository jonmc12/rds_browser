(function() {
  describe("CustomerAddress", function() {
    beforeEach(function() {
      return this.customerAddress = new App.CustomerAddress();
    });
    it("should have a base url", function() {
      return expect(this.customerAddress.url()).toEqual("/addresses");
    });
    it("should have a url for ID", function() {
      this.customerAddress.set({
        id: 1
      });
      return expect(this.customerAddress.url()).toEqual("/addresses/1.json");
    });
    return it("should save the Customer's Address to the server", function() {
      fakeAjax({
        registrations: [
          {
            url: "/addresses/1.json",
            type: "put",
            successData: {
              success: 201
            }
          }, {
            url: "/addresses/1.json",
            type: "post",
            successData: {
              success: 201
            }
          }
        ]
      });
      this.customerAddress.set({
        id: 1
      });
      this.customerAddress.save();
      return expect(this.customerAddress.get('success')).toBe(201);
    });
  });
}).call(this);
