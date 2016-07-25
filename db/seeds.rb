# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  user = User.create!(
    name: Faker::Name.name,
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    bio: Faker::Lorem.paragraph,
    bio_image: "https://unsplash.it/400/400?random",
    password: "password"
  )

  20.times do
    Post.create!(
      user: user,
      body: "This is a test of the emergency broadcast system. In case of a real emergency, break glass and run!"
    )
  end
end
