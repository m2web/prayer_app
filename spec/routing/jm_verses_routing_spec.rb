require "spec_helper"

describe JmVersesController do
  describe "routing" do

    it "routes to #index" do
      get("/jm_verses").should route_to("jm_verses#index")
    end

    it "routes to #new" do
      get("/jm_verses/new").should route_to("jm_verses#new")
    end

    it "routes to #show" do
      get("/jm_verses/1").should route_to("jm_verses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/jm_verses/1/edit").should route_to("jm_verses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/jm_verses").should route_to("jm_verses#create")
    end

    it "routes to #update" do
      put("/jm_verses/1").should route_to("jm_verses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/jm_verses/1").should route_to("jm_verses#destroy", :id => "1")
    end

  end
end
