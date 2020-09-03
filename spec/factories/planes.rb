FactoryBot.define do
  factory :plane do
    code {Settings.rspec.planes.code}
    status {Settings.rspec.planes.status}
  end
end
