require "spec_helper"

describe TestModelsController do
  describe "routing" do

    it "routes to #index" do
      get("/test_models").should route_to("test_models#index")
    end

    it "routes to #new" do
      get("/test_models/new").should route_to("test_models#new")
    end

    it "routes to #show" do
      get("/test_models/1").should route_to("test_models#show", :id => "1")
    end

    it "routes to #edit" do
      get("/test_models/1/edit").should route_to("test_models#edit", :id => "1")
    end

    it "routes to #create" do
      post("/test_models").should route_to("test_models#create")
    end

    it "routes to #update" do
      put("/test_models/1").should route_to("test_models#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/test_models/1").should route_to("test_models#destroy", :id => "1")
    end

  end
end
