FactoryBot.define do
  factory :warehouse do
    name {Settings.rspec.warehouses.name}
    area {Settings.rspec.warehouses.area}
    amount {Settings.rspec.warehouses.amount}
  end
end
