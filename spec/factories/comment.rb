FactoryGirl.define do
  factory :comment do
    body 'This is a super important comment, with a super important purpose'
    topic_id { FactoryGirl.create(:topic, :active, :unlocked).id }
    user_id { FactoryGirl.create(:user) }

    trait :locked do
      is_locked true
    end

    trait :unlocked do
      is_locked false
    end
  end
end