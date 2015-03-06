require "rails_helper"

RSpec.describe NewsStoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/news_stories").to route_to("news_stories#index")
    end

    it "routes to #new" do
      expect(:get => "/news_stories/new").to route_to("news_stories#new")
    end

    it "routes to #show" do
      expect(:get => "/news_stories/1").to route_to("news_stories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/news_stories/1/edit").to route_to("news_stories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/news_stories").to route_to("news_stories#create")
    end

    it "routes to #update" do
      expect(:put => "/news_stories/1").to route_to("news_stories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/news_stories/1").to route_to("news_stories#destroy", :id => "1")
    end

  end
end
