require "rails_helper"

RSpec.describe Warehouse, type: :model do
  let(:warehouse) {FactoryBot.create :warehouse}
  describe "Validations" do
    context "when all required fields given" do
      it "should be true" do
        expect(warehouse.valid?).to eq true
      end
    end
  end

  describe "Associations" do
    it "should has many locations" do
      is_expected.to have_many(:locations).dependent(:destroy)
    end

    it "should has many users" do
      is_expected.to have_many(:users).dependent(:destroy)
    end
  end
end
