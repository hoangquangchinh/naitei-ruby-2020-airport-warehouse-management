FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Settings.rspec.users.email}
    password {Settings.rspec.users.password}
    password_confirmation {Settings.rspec.users.password_confirmation}
  end
end
