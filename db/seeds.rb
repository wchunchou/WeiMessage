# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "floydesk", password: "12345678", email: "chou.w.chun@gmail.com")
User.create(username: "user1", password: "12345678", email: "kickdesk@gmail.com")
User.create(username: "user2", password: "12345678", email: "kickdesk+1@gmail.com")

Message.create(body:'hello world', user: User.first)
Message.create(body:'How are you?', user: User.last)