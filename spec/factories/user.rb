FactoryGirl.define do
  factory :user do
    email 'test_user@german_lernen.com'
    username 'TestUser1'
    password 'Testing123'
    password_confirmation 'Testing123'
  end
end
