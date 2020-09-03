require "rails_helper"

RSpec.describe User, type: :model do
  let!(:unit) {FactoryBot.create :unit}
  let!(:warehouse) {FactoryBot.create :warehouse}
  let(:user) {FactoryBot.create :user, unit_id: unit.id, warehouse_id: warehouse.id}
  let!(:user_fail) {FactoryBot.build :user, password: nil}

  describe "Validations" do
    context "when all required fields given" do
      it "should be true" do
        expect(user.valid?).to eq true
      end
    end

    context "when missing required fields" do
      it "should be false" do
        expect(user_fail.valid?).to eq false
      end
    end
  end

  describe "Associations" do
    it "should belongs to warehouse" do
      is_expected.to belong_to(:warehouse)
    end

    it "should has many unit" do
      is_expected.to belong_to(:unit)
    end

    it "should has many requests" do
      is_expected.to have_many(:requests).dependent(:destroy)
    end
  end

  describe "delegations" do
    it "should delegate to warehouse's name  with method #name" do
      should delegate_method(:name).to(:warehouse).with_prefix
    end
  end
end
