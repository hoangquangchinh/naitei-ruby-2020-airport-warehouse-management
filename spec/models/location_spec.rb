require "rails_helper"

RSpec.describe Location, type: :model do
  let!(:warehouse) {FactoryBot.create :warehouse}
  let(:location) {FactoryBot.create :location, warehouse_id: warehouse.id}
  describe "scopes" do
    include_examples "create example locations"

    describe "#get_ready" do
      it "should return locations with warehouse of gara" do
        expect(Location.get_ready.size).to eq(1)
      end
    end

    describe "#ready_false" do
      it "should return locations with warehouse of ready and filled is false" do
        expect(Location.ready_false.size).to eq(0)
      end
    end
  end
  
  describe "Validations" do
    let(:location) {FactoryBot.create :location, warehouse_id: warehouse.id}
    context "when all required fields given" do
      it "should be true" do
        expect(location.valid?).to eq true
      end
    end
  end

  describe "Associations" do
    it "should belongs to warehouse" do
      is_expected.to belong_to(:warehouse)
    end

    it "should has many requests" do
      is_expected.to have_many(:requests).dependent(:destroy)
    end

    it "should has many planes" do
      is_expected.to have_many(:planes).through(:requests)
    end
  end

  describe "delegations" do
    it "should delegate to warehouse's name  with method #name" do
      should delegate_method(:name).to(:warehouse).with_prefix
    end
  end
end
