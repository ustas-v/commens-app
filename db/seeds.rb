# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = 10.times.map do
  last_name, first_name = FFaker::NameRU.name.split(' ')
  {
    email: FFaker::Internet.email, login: FFaker::Internet.user_name,
    password: '123456789', password_confirmation: '123456789',
    first_name: first_name, last_name: last_name
  }
end
User.create users