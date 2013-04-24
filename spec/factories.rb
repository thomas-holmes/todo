FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    password "abcdefghi"
    password_confirmation "abcdefghi"
  end
  factory :task do
    sequence(:description) { |n| "Test description #{n}" }
    sequence(:importance) { |n| %w(low medium high)[n%3] }
    user
  end
end
