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
    bio_image: Faker::Avatar.image("my-own-slug", "400x400"),
    password: "password"
  )
  20.times do
    Post.create!(user: user,
      body: Faker::Lorem.characters(160)
    )
  end
end
