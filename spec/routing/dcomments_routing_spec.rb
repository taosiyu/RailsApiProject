require "rails_helper"

RSpec.describe DcommentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dcomments").to route_to("dcomments#index")
    end


    it "routes to #show" do
      expect(:get => "/dcomments/1").to route_to("dcomments#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/dcomments").to route_to("dcomments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/dcomments/1").to route_to("dcomments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/dcomments/1").to route_to("dcomments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dcomments/1").to route_to("dcomments#destroy", :id => "1")
    end

  end
end
