require "rails_helper"

RSpec.describe "API V1 Locations", type: :request do
  describe "GET /api/v1/locations" do
    context "with valid parameters" do
      before{get "/api/v1/locations"}
      it "should return success status" do
        expect_status 200
      end
    end
  end
end
