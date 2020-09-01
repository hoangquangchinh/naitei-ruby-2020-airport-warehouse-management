FactoryBot.define do
  factory :request do
    time {Time.zone.now}
    reason {Settings.rspec.requests.reason}
  end
end
