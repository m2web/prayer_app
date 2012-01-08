require "spec_helper"

describe WestminsterCatechismQandAsController do
  describe "routing" do

    it "routes to #index" do
      get("/westminster_catechism_qand_as").should route_to("westminster_catechism_qand_as#index")
    end

    it "routes to #new" do
      get("/westminster_catechism_qand_as/new").should route_to("westminster_catechism_qand_as#new")
    end

    it "routes to #show" do
      get("/westminster_catechism_qand_as/1").should route_to("westminster_catechism_qand_as#show", :id => "1")
    end

    it "routes to #edit" do
      get("/westminster_catechism_qand_as/1/edit").should route_to("westminster_catechism_qand_as#edit", :id => "1")
    end

    it "routes to #create" do
      post("/westminster_catechism_qand_as").should route_to("westminster_catechism_qand_as#create")
    end

    it "routes to #update" do
      put("/westminster_catechism_qand_as/1").should route_to("westminster_catechism_qand_as#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/westminster_catechism_qand_as/1").should route_to("westminster_catechism_qand_as#destroy", :id => "1")
    end

  end
end
