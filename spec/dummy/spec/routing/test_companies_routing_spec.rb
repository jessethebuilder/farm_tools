require "spec_helper"

describe TestCompaniesController do
  describe "routing" do

    it "routes to #index" do
      get("/test_companies").should route_to("test_companies#index")
    end

    it "routes to #new" do
      get("/test_companies/new").should route_to("test_companies#new")
    end

    it "routes to #show" do
      get("/test_companies/1").should route_to("test_companies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/test_companies/1/edit").should route_to("test_companies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/test_companies").should route_to("test_companies#create")
    end

    it "routes to #update" do
      put("/test_companies/1").should route_to("test_companies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/test_companies/1").should route_to("test_companies#destroy", :id => "1")
    end

  end
end
