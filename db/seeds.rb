# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
User.create([
  { name: "Carlos Arrieta", password: "123456", email: "user1.micolet.com", phone: "+573042075846" },
  { password: "123456", email: "user2.micolet.com" },
])

Category.create([
  { name: "Moda Mujer" },
  { name: "Moda Hombre" },
  { name: "Moda Infantil" },
])
