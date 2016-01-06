namespace :todo do
  desc "delete old items"
  task delete_items: :environment do
    Task.where(days_left < 0).destroy_all
    puts "Delete items task complete"
  end
end
