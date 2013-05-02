namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    u = User.create!(email: "test@example.com", password: "abcdefghi", password_confirmation: "abcdefghi")
    3.times { |i| u.lists.create!(title: "list_#{i}") }
    u.lists.each do |l|
      5.times { |i| l.tasks.create!(description: "task_description_#{i}") }
    end
  end
end
