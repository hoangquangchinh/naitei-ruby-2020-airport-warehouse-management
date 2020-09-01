require "rails_helper"

RSpec.describe Plane, type: :model do
  let(:plane) {FactoryBot.create :plane}
  describe "Validations" do
    context "when all required fields given" do
      it "should be true" do
        expect(plane.valid?).to eq true
      end
    end
  end
end