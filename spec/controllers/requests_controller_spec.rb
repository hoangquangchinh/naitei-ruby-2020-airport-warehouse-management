require "rails_helper"
require "spec_helper"
include RSpecSessionHelper

RSpec.describe RequestsController, type: :controller do
   before(:each) do
    login
  end

  describe "GET requests#index" do
    it "should render :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "POST requests#new" do
    it "should render :new view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST requests#create" do
    context "with valid attributes" do
      it "should create new request object" do
        get :new
        expect(assigns(:request)).to be_a_new(Request)
      end
    end
  end
end
