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
end
