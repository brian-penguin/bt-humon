
FactoryGirl.define do
  factory :event do
    lat
    lon
    name
    started_at
    #owner factory: :user
  end
end
