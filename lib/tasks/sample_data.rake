namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    importance = [:low, :medium, :high]

    20.times do
      Task.create!(description: Faker::Lorem.sentence, importance: importance.sample)
    end
  end
end
