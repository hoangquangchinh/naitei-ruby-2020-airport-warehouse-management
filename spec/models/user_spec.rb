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
end
