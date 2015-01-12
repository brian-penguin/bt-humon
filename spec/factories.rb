
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

    trait :boston do
      lat 42.36701
      lon (-71.08021)
    end

    trait :worcester do
      lat 42.25975
      lon (-71.78677)
    end

    trait :springfield do
      lat 42.09955
      lon (-72.58538)
    end

    trait :san_fran do
      lat 37.77188
      lon (-122.40522)
    end
  end

  factory :user do
    device_token { generate(:token) }
  end
end
