# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  user = User.create(name: Faker::Name.name, 
    password: "password", 
    email: Faker::Internet.email, 
    location: '10001')
  5.times do
    tool = Tool.create(name: Faker::Commerce.product_name, 
      safety_level: 'safe', 
      condition: 'new', 
      lender_id: user.id)
  end
end
