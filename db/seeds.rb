# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Tags
FriendTag.create(
  [
    { name: 'ランク' },
    { name: 'アンレート' },
    { name: '大学生' },
    { name: '高校生' },
    { name: '中学生' },
    { name: '社会人' },
    { name: 'だれでも' },
    { name: '楽しく' },
    { name: '勝ち重視' },
    { name: 'まったり' },
    { name: 'ガッツリ' },
    { name: 'Discord' },
    { name: 'TS3' },
    { name: 'Skype' },
    { name: 'ゲーム内VC' },
    { name: '大会参加経験あり' },
    { name: '大会入賞歴あり' }
  ]
)

PartyTag.create(
  [
    { name: 'ランク' },
    { name: 'アンレート' },
    { name: '大学生' },
    { name: '高校生' },
    { name: '中学生' },
    { name: '社会人' },
    { name: 'だれでも' },
    { name: '楽しく' },
    { name: '勝ち重視' },
    { name: 'まったり' },
    { name: 'ガッツリ' },
    { name: 'Discord' },
    { name: 'TS3' },
    { name: 'Skype' },
    { name: 'ゲーム内VC' },
    { name: '1~2回' },
    { name: '3~5回' },
    { name: '5回以上' }
  ]
)

TeamTag.create(
  [
    { name: 'ランク' },
    { name: 'アンレート' },
    { name: 'スクリム' },
    { name: '大学生' },
    { name: '高校生' },
    { name: '中学生' },
    { name: '社会人' },
    { name: 'だれでも' },
    { name: '楽しく' },
    { name: '勝ち重視' },
    { name: 'まったり' },
    { name: 'ガッツリ' },
    { name: 'Discord' },
    { name: 'TS3' },
    { name: 'Skype' },
    { name: 'ゲーム内VC' },
    { name: '新設チーム' },
    { name: '平日活動' },
    { name: '土日活動' },
    { name: '週1~2活動' },
    { name: '週3~4活動' },
    { name: '週5~6活動' },
    { name: '毎日活動' },
    { name: '1~2時間' },
    { name: '3~4時間' },
    { name: '5時間以上' },
    { name: 'フルタイム' },
    { name: 'ロール不問' },
    { name: 'IGL' },
    { name: 'Attacker' },
    { name: 'Suport' },
    { name: 'Sniper' },
    { name: 'Lurker' },
    { name: '作戦会議' },
    { name: '反省会' },
    { name: '大会出場予定' },
    { name: '大会出場経験あり' },
    { name: '大会入賞' }
  ]
)

ScoutTag.create(
  [
    { name: 'ランク' },
    { name: 'アンレート' },
    { name: 'スクリム' },
    { name: '大学生' },
    { name: '高校生' },
    { name: '中学生' },
    { name: '社会人' },
    { name: 'だれでも' },
    { name: '楽しく' },
    { name: '勝ち重視' },
    { name: 'まったり' },
    { name: 'ガッツリ' },
    { name: 'Discord' },
    { name: 'TS3' },
    { name: 'Skype' },
    { name: 'ゲーム内VC' },
    { name: '新設チーム' },
    { name: '平日活動' },
    { name: '土日活動' },
    { name: '週1~2活動' },
    { name: '週3~4活動' },
    { name: '週5~6活動' },
    { name: '毎日活動' },
    { name: '1~2時間' },
    { name: '3~4時間' },
    { name: '5時間以上' },
    { name: 'フルタイム' },
    { name: 'ロール希望なし' },
    { name: 'IGL' },
    { name: 'Attacker' },
    { name: 'Suport' },
    { name: 'Sniper' },
    { name: 'Lurker' },
    { name: '作戦会議' },
    { name: '反省会' },
    { name: '大会出場経験あり' },
    { name: '大会入賞' }
  ]
)

creator = User.create(
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
viewer = User.create(
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
visiter = User.create(
  email: 'tester3@test.com',
  password: 'foobar111',
  nickname: '3nd User',
  gender_id: '3',
  birthday: '1999-09-15',
  profile: 'This is my profile text.',
  twitter_name: 'twittername3',
  twitch_name: 'twitchusername3',
  mildom_name: '33333333'
)

myteam = Myteam.create(user_id: creator.id, team_name: 'BestTeamEver', team_profile: '先月できたばかりのチームです！よろしくおねがいします！')

9.times do
  FactoryBot.create(:friend)
  FactoryBot.create(:party)
  FactoryBot.create(:team)
  FactoryBot.create(:scout)
end

# friends table
Friend.create(user_id: creator.id, friend_title: '初心者です', friend_game_id: 'Gamer#0915', friend_text: '初心者のフレンドを募集しています。', friend_tag_ids: %w[1 2 6 7 8 12 13 15])
Friend.create(user_id: creator.id, friend_title: 'ランクフレンド募集', friend_game_id: 'Gamer#0915', friend_text: 'ランクで勝ちに行くフレンドを募集。', friend_tag_ids: %w[1 2 6 7 8 12 13 15])
Friend.create(user_id: creator.id, friend_title: 'アンレートフレンド募集', friend_game_id: 'Gamer#0915', friend_text: '一緒にアンレートをプレイするフレンド募集中！', friend_tag_ids: %w[1 2 6 7 8 12 13 15])
Friend.create(user_id: creator.id, friend_title: 'フレンド募集！', friend_game_id: 'Gamer#0915', friend_text: '一緒にゲームをするフレンド募集中！楽しくプレイできる方！', friend_tag_ids: %w[1 2 6 7 8 12 13 15])

# parties table
Party.create(user_id: creator.id, party_title: '5人でプレイしたい！', party_game_id: 'Gamer#0915', party_text: '一人なので5人パーティーでプレイしてみたいです！', party_tag_ids: %w[1 6 9 12 13 17])
Party.create(user_id: creator.id, party_title: 'パーティーメンバー募集', party_game_id: 'Gamer#0915', party_text: '一緒に遊ぶ人募集', party_tag_ids: %w[1 6 9 12 13 17])
Party.create(user_id: creator.id, party_title: '今夜プレイするメンバー募集', party_game_id: 'Gamer#0915', party_text: '今日の20:00~一緒に遊ぶメンバー募集です', party_tag_ids: %w[1 6 9 12 13 17])
Party.create(user_id: creator.id, party_title: 'パーティーメンバー募集！', party_game_id: 'Gamer#0915', party_text: '一緒にプレイするパーティーメンバー募集', party_tag_ids: %w[1 6 9 12 13 17])

# teams table
Team.create(user_id: creator.id, myteam_id: myteam.id, team_title: 'チームメンバー募集', team_game_id: 'Gamer#0915', team_text: '募集中', team_tag_ids: %w[1 3 8 13 17 18 19 21 25 28 36])
Team.create(user_id: creator.id, myteam_id: myteam.id, team_title: 'アタッカー募集', team_game_id: 'Gamer#0915', team_text: 'アタッカーが出来るメンバーを募集しています。', team_tag_ids: %w[1 3 8 13 17 18 19 21 25 28 36])
Team.create(user_id: creator.id, myteam_id: myteam.id, team_title: 'ランクメインのチームメンバー募集', team_game_id: 'Gamer#0915', team_text: 'ランクでの活動がメインのチームです！', team_tag_ids: %w[1 3 8 13 17 18 19 21 25 28 36])
Team.create(user_id: creator.id, myteam_id: myteam.id, team_title: 'チームメンバー募集', team_game_id: 'Gamer#0915', team_text: '先月できたばかりのチームなのでメンバー募集中です！', team_tag_ids: %w[1 3 8 13 17 18 19 21 25 28 36])

# scouts table
Scout.create(user_id: creator.id, scout_title: 'スカウト募集', scout_game_id: 'Gamer#0915', scout_text: 'チーム探してます', scout_tag_ids: %w[1 7 9 13 14 17 19 20 22 26 29 37 38])
Scout.create(user_id: creator.id, scout_title: 'スクリムしたいです', scout_game_id: 'Gamer#0915', scout_text: 'スクリム中心のチームを探しています。', scout_tag_ids: %w[1 7 9 13 14 17 19 20 22 26 29 37 38])
Scout.create(user_id: creator.id, scout_title: 'スナイパースカウト募集', scout_game_id: 'Gamer#0915', scout_text: 'スナイパーメインで活動しています。参加させていただけるチームを募集！', scout_tag_ids: %w[1 7 9 13 14 17 19 20 22 26 29 37 38])
Scout.create(user_id: creator.id, scout_title: 'スカウト募集', scout_game_id: 'Gamer#0915', scout_text: '加入するチームを探しています！', scout_tag_ids: %w[1 7 9 13 14 17 19 20 22 26 29 37 38])
