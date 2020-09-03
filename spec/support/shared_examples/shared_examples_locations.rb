RSpec.shared_examples "create example locations" do
  before do
    FactoryBot.create(
      :location,
      filled: true
    )
    FactoryBot.create(
      :location,
      filled: false
    )
  end
end
