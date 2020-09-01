FactoryBot.define do
  factory :unit do
    name {Settings.rspec.units.name}
    description {Settings.rspec.units.description}
  end
end
