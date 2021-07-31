# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  name: "丸山紗季",
  email: "sakisaki0831@icloud.com",
  password: "39cluessk",
  is_admin: true
)
User.create!(
  name: "吉沢亮",
  email: "bzmatumotoryo@icloud.com",
  password: "password",
  is_admin: true
)
