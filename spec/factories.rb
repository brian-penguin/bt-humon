FactoryGirl.define do
  sequence :name do |n|
    "name #{n}"
  end

  sequence :started_at do |n|
    n.hours.from_now
  end

  sequence :token do
    SecureRandom.hex(3)
  end

  factory :event do
    lat { Faker::Address.latitude.to_f.round(5) }
    lon { Faker::Address.longitude.to_f.round(5) }
    name
    started_at
    owner factory: :user
  end

  factory :user do
    device_token { generate(:token) }
  end
end
