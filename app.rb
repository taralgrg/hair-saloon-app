require("sinatra")
  require("sinatra/reloader")
  also_reload("lib/**/*.rb")
  require("./lib/client")
  require("./lib/stylist")
  require("pg")
  require('pry')

  DB = PG.connect({:dbname => "hair_saloon"})

  post("/") do
    @stylists= Stylist.all()
    @clients=Client.all()
    erb(:index)
  end

  get("/") do
    @stylists= Stylist.all()
    @clients=Client.all()
    erb(:index)
  end

  post("/stylists") do
    name = params.fetch("name")
    stylist = Stylist.new({:name => name, :id => nil})
    stylist.save()
    @stylists = Stylist.all()
    @clients=Client.all()
    erb(:index)
  end

  get("/stylists/:id") do
    @stylist = Stylist.find(params.fetch("id").to_i())
    erb(:stylist_edit)
  end

  post("/clients") do
     name = params.fetch("name")
     stylist_id = params.fetch("stylist_id").to_i()
     client = Client.new({:name => name, :stylist_id => stylist_id})
     client.save()
     @stylist = Stylist.find(stylist_id)
     erb(:stylist)
   end

   get("/stylists/:id/edit") do
     @stylist = Stylist.find(params.fetch("id").to_i())
     erb(:stylist_edit)
   end

   patch("/stylists/:id") do
     name = params.fetch("name")
     @stylist = Stylist.find(params.fetch("id").to_i())
     @stylist.update({:name => name})
     erb(:stylist)
    end

   delete("/stylists/:id") do
     @stylist = Stylist.find(params.fetch("id").to_i())
     @stylist.delete()
     @stylists = Stylist.all()
     erb(:index)
   end

   get("/clients/:id/edit") do
     @client = Client.find(params.fetch("id").to_i())
     erb(:client_edit)
   end

   patch("/clients/:id") do
     name = params.fetch("name")
     @client = Client.find(params.fetch("id").to_i())
     @client.update({:name => name})
     erb(:success)
    end

   delete("/clients/:id") do
     @client = Client.find(params.fetch("id").to_i())
     @client.delete()
     @clients = Client.all()
     erb(:success)
   end

   get("/clients/:id") do
     @client = Client.find(params.fetch("id").to_i())
     erb(:client)
   end
