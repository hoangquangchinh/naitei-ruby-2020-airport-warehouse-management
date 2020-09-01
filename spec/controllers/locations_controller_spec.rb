require "rails_helper"
require "spec_helper"
include RSpecSessionHelper

RSpec.describe LocationsController, type: :controller do
   before(:each) do
    login
  end

  describe "GET locations#index" do
    it "should render :index view" do
      get :index
      expect(response).to render_template :index
    end
  end
end
