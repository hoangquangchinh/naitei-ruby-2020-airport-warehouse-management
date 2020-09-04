RSpec.shared_examples "create example locations" do
  before do
    FactoryBot.create(
      :location,
      warehouse_id: FactoryBot.create(:warehouse).id,
      filled: true
    )
    FactoryBot.create(
      :location,
      warehouse_id: FactoryBot.create(:warehouse).id,
      filled: false
    )
  end
end
