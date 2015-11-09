FactoryGirl.define do
  factory :forum do
    name 'General Discussion'
    description 'Talk about stuff and things'
    topic_count 0

    trait :active do
      is_active true
    end

    trait :inactive do
      is_active false
    end
  end
end
