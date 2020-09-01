require "rails_helper"
require "spec_helper"
include RSpecSessionHelper

RSpec.describe UsersController, type: :controller do
   before(:each) do
    login
  end

  describe "GET users#index" do
    it "should render :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "POST users#new" do
    it "should render :new view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST Users#create" do
    context "with valid attributes" do
      it "should create new user object" do
        get :new
        expect(assigns(:user)).to be_a_new(User)
      end
    end
  end
end
