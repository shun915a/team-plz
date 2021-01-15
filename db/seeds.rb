# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  email: 'tester@test.com',
  password: 'foobar111',
  nickname: '1st User',
  gender_id: '1',
  birthday: '1990-01-01',
  profile: 'This is my profile text.',
  twitter_name: 'twittename',
  twitch_name: 'twitchusername',
  mildom_name: '12345678'
)
User.create(
  email: 'tester2@test.com',
  password: 'foobar111',
  nickname: '2nd User',
  gender_id: '2',
  birthday: '1995-05-15',
  profile: 'This is my profile text.',
  twitter_name: 'twittername2',
  twitch_name: 'twitchusername2',
  mildom_name: '22222222'
)
