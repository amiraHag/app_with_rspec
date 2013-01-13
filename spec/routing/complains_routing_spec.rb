require "spec_helper"

describe ComplainsController do
  describe "routing" do

    it "routes to #index" do
      get("/complains").should route_to("complains#index")
    end

    it "routes to #new" do
      get("/complains/new").should route_to("complains#new")
    end

    it "routes to #show" do
      get("/complains/1").should route_to("complains#show", :id => "1")
    end

    it "routes to #edit" do
      get("/complains/1/edit").should route_to("complains#edit", :id => "1")
    end

    it "routes to #create" do
      post("/complains").should route_to("complains#create")
    end

    it "routes to #update" do
      put("/complains/1").should route_to("complains#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/complains/1").should route_to("complains#destroy", :id => "1")
    end

  end
end
