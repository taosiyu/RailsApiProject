require "rails_helper"

RSpec.describe DiscoveriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/discoveries").to route_to("discoveries#index")
    end


    it "routes to #show" do
      expect(:get => "/discoveries/1").to route_to("discoveries#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/discoveries").to route_to("discoveries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/discoveries/1").to route_to("discoveries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/discoveries/1").to route_to("discoveries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/discoveries/1").to route_to("discoveries#destroy", :id => "1")
    end

  end
end
