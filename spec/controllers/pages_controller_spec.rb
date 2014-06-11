require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  render_views
  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      expect(response).to be_success
    end
    it  "should have the right title" do
      get 'home'
      expect(response).to have_selector("title", :content => "Ruby on Rails Sample App | Home")
    end 
  end


  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      expect(response).to be_success
    end
    it  "should have the right title" do
      get 'contact'
      expect(response).to have_selector("title", :content => "Ruby on Rails Sample App | Contact")
    end
  end
  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      expect(response).to be_success
    end
    it  "should have the right title" do
      get 'about'
      expect(response).to have_selector("title", :content => "Ruby on Rails Sample App | About")
    end
  end

end
