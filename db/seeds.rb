20.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password'
  )
  user.save
end

users = User.all

100.times do
  task = Task.new(
    user: users.sample,
    description: Faker::Lorem.sentence
  )
  task.save
end

admin = User.new(
   name:     'Todd Channick',
   email:    'toc5012@gmail.com',
   password: 'password',
   admin: true
)
admin.save


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Task.count} tasks created"
