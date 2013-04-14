FactoryGirl.define do
  factory :task do
    sequence(:description) { |n| "Test description #{n}" }
    sequence(:importance) { |n| %w(low medium high)[n%3] }
  end
end
