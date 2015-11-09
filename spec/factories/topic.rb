FactoryGirl.define do
  factory :topic do
    title 'Super important question about German.'
    body 'I have a super fake, yet super important question that I will now ask in this topic.'
    forum_id { FactoryGirl.create(:forum, :active).id }
    user_id { FactoryGirl.create(:user).id }

    trait :active do
      is_active true
    end

    trait :inactive do
      is_active false
    end

    trait :locked do
      is_locked true
    end

    trait :unlocked do
      is_locked false
    end
  end
end
