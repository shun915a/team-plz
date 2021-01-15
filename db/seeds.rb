# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'tester@test.com', password: 'foobar111', nickname: '1st User', gender_id: 1, birthday: 1990 - 0o1 - 0o1, twitter_name: 'twitterusername', twitch_name: 'twitchusername', mildom_name: '12345678')
User.create(email: 'tester@test.com', password: 'foobar111', nickname: '2nd User', gender_id: 2, birthday: 1995 - 11 - 11, twitter_name: 'twitterusername2', twitch_name: 'twitchusername2', mildom_name: '123456789')
