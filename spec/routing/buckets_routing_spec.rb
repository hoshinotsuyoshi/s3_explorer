require "rails_helper"

RSpec.describe BucketsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/buckets").to route_to("buckets#index")
    end

    it "routes to #new" do
      expect(:get => "/buckets/new").to route_to("buckets#new")
    end

    it "routes to #show" do
      expect(:get => "/buckets/1").to route_to("buckets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/buckets/1/edit").to route_to("buckets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/buckets").to route_to("buckets#create")
    end

    it "routes to #update" do
      expect(:put => "/buckets/1").to route_to("buckets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/buckets/1").to route_to("buckets#destroy", :id => "1")
    end

  end
end
