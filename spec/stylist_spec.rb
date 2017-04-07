require("spec_helper")

describe(Stylist) do

  describe(".all") do
    it("starts off with no Stylist") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you its name") do
      stylist = Stylist.new({:name => "moringaschool stuff", :id => nil})
      expect(stylist.name()).to(eq("moringaschool stuff"))
    end
  end

  describe("#save") do
    it("lets you save stylist to the database") do
      stylist = Stylist.new({:name => "moringaschool stuff", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new({:name => "moringaschool stuff", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name") do
      stylist = Stylist.new({:name => "moringaschool stuff", :id => nil})
      stylist2 = Stylist.new({:name => "moringaschool stuff", :id => nil})
      expect(stylist).to(eq(stylist2))
    end
  end

  describe(".find") do
    it("returns a stylist by its ID") do
      test_stylist = Stylist.new({:name => "Moringaschool stuff",  :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Home stuff",  :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#clients") do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({:name => "Moringaschool stuff",  :id => nil})
      test_stylist.save()
      test_client = Client.new({:name => "Learn SQL", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:name => "Review Ruby", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end

  describe("#update") do
    it("lets you update stylists list in the database") do
      test_stylist = Stylist.new({:name => "Moringa School stuff",  :id => nil})
      test_stylist.save()
      test_stylist.update({:name => "Homework stuff"})
      expect(test_stylist.name()).to(eq("Homework stuff"))
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new({:name => "Moringa School stuff", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => "House stuff", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end

    it("deletes a stylist's clients from the database") do
      stylist = Stylist.new({:name => "Moringa School stuff", :id => nil})
      stylist.save()
      client = Client.new({:name => "learn SQL", :stylist_id => stylist.id()})
      client.save()
      client2 = Client.new({:name => "Review Ruby", :stylist_id => stylist.id()})
      client2.save()
      stylist.delete()
      expect(Client.all()).to(eq([]))
    end
  end
end
