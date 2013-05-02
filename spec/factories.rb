FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    password "abcdefghi"
    password_confirmation "abcdefghi"
  end
  factory :list do
    sequence(:title) { |n| "task list_#{n}" }
    user
  end
  factory :task do
    sequence(:description) { |n| "Test description #{n}" }
    list
  end
end
