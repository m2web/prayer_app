require 'spec_helper'

describe PrayerPagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'today'" do
    it "returns http success" do
      get 'today'
      response.should be_success
    end
  end

end
