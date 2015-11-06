namespace :todo do
  desc "delete old items"
  task delete_items: :environment do
    Task.where("created_at <= ?", Time.now - 7.days).destroy_all
    puts "Delete items task complete"
  end
end
