FactoryBot.define do
  factory :location do
    warehouse_id {FactoryBot.create(:warehouse).id}
    filled {true}
  end
end
