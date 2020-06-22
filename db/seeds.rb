# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_01 = User.create({username: "Anna", email: "anna@mail.com", password: "a"})
user_02 = User.create({username: "Max", email: "max@mail.com", password: "a"})
user_03 = User.create({username: "Jimmy", email: "jimmy@mail.com", password: "a"})

result_01 = Result.create({empathy: 1, communication: 3, sharedecision: 2, user: user_01})
result_02 = Result.create({empathy: 0, communication: 2, sharedecision: 3, user: user_01})
result_03 = Result.create({empathy: 3, communication: 3, sharedecision: 2, user: user_02})
result_04 = Result.create({empathy: 2, communication: 3, sharedecision: 1, user: user_02})
result_05 = Result.create({empathy: 1, communication: 1, sharedecision: 1, user: user_03})
result_06 = Result.create({empathy: 3, communication: 2, sharedecision: 3, user: user_03})