require "rails_helper"

RSpec.describe Request, type: :model do
  let!(:unit) {FactoryBot.create :unit}
  let!(:warehouse) {FactoryBot.create :warehouse}
  let!(:location) {FactoryBot.create :location, warehouse_id: warehouse.id}
  let!(:plane) {FactoryBot.create :plane}
  let!(:user) {FactoryBot.create :user, unit_id: unit.id, warehouse_id: warehouse.id}
  let(:request) {FactoryBot.create :request, location_id: location.id, plane_id: plane.id, user_id: user.id}
  let(:request_fail) {FactoryBot.build :request, location_id: location.id, plane_id: plane.id, user_id: nil}
  describe "Validations" do
    context "when all required fields given" do
      it "should be true" do
        expect(request.valid?).to eq true
      end

      context "when missing required fields" do
        it "should be false" do
          expect(request_fail.valid?).to eq false
        end
      end
    end
  end

  describe "Associations" do
    it "should belongs to plane" do
      is_expected.to belong_to(:plane)
    end

    it "should belongs to user" do
      is_expected.to belong_to(:user)
    end

    it "should belongs to location" do
      is_expected.to belong_to(:location)
    end
  end

  describe "delegations" do
    it "should delegate to plane code  with method #code" do
      should delegate_method(:code).to(:plane).with_prefix
    end

    it "should delegate to plane user name  with method #name" do
      should delegate_method(:name).to(:user).with_prefix
    end
  end
end
