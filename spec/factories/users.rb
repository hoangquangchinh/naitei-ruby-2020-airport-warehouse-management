FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Settings.rspec.users.email}
    password {Settings.rspec.users.password}
    password_confirmation {Settings.rspec.users.password_confirmation}
    warehouse_id {FactoryBot.create(:warehouse).id}
    unit_id {FactoryBot.create(:unit).id}
  end
end
