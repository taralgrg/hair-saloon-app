require("spec_helper")

describe(Client) do
  describe('.all') do
    it('starts off with no clients') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same client if they have the same name and Id") do
      client1 = Client.new({:name => 'lolo', :id => nil, :stylist_id => 1})
      client2 = Client.new({:name => 'lolo', :id => nil, :stylist_id => 1})
      expect(client1).to(eq(client2))
    end
  end

  # describe("#name") do
  #   it('gives client a name') do
  #     test_client = Client.new({:name => "Polo", :id => nil, :stylist_id => 1})
  #     expect(test_client.name()).to(eq('Polo'))
  #   end
  # end
  #
  # describe("#save") do
  #   it("returns an array of clients when saved") do
  #     test_client = Client.new({:name => 'Polo', :id => nil, :stylist_id => 1})
  #     test_client.save()
  #     expect(Client.all()).to(eq([test_client]))
  #   end
  # end
  #
  # describe("#stylist_id") do
  #   it("lets you read the Stylist's ID out") do
  #     test_client = Client.new({:name => "learn SQL", :id => nil, :stylist_id => 1})
  #     expect(test_client.stylist_id()).to(eq(1))
  #   end
  # end
  #

  #
  #
  #   describe(".find") do
  #     it("returns a client by its ID") do
  #       test_client = Client.new({:name => "Moringaschool stuff", :id => nil, :stylist_id => 1})
  #       test_client.save()
  #       test_client2 = Client.new({:name => "Home stuff", :id => nil, :stylist_id => 1})
  #       test_client2.save()
  #       expect(Client.find(test_client2.id())).to(eq(test_client2))
  #     end
  #   end
  #
  #   describe("#update") do
  #     it("lets you update clients list in the database") do
  #       test_client = Client.new({:name => "Moringa School stuff", :id => nil,  :stylist_id => 1})
  #       test_client.save()
  #       test_client.update({:name => "Homework stuff"})
  #       expect(test_client.name()).to(eq("Homework stuff"))
  #     end
  #   end
  #
  #   describe("#delete") do
  #     it("lets you delete a client from the database") do
  #       client = Client.new({:name => "Moringa School stuff", :id => nil, :stylist_id => 1})
  #       client.save()
  #       client2 = Client.new({:name => "House stuff", :id => nil, :stylist_id => 1})
  #       client2.save()
  #       client.delete()
  #       expect(Client.all()).to(eq([client2]))
  #     end
  #   end
  end
