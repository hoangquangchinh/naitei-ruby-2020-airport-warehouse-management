require "rails_helper"
require "spec_helper"
include RSpecSessionHelper

RSpec.describe PlanesController, type: :controller do
   before(:each) do
    login
  end

  describe "GET planes#index" do
    it "should render :index view" do
      get :index
      expect(response).to render_template :index
    end
  end
end
