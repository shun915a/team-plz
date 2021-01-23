<img src="https://i.imgur.com/9FcJ6UJ.png" width="200">　
<img src="https://i.imgur.com/Tr1oWT2.png" width="200">　
<img src="https://i.imgur.com/9ctd54w.png" width="200">

# アプリケーション概要

[team-plz.com](http://team-plz.com/)

このアプリケーションはゲーマー向けの SNS です。
ゲーマーが一緒にプレイする友達を探したり、チームを作成する際にメンバーの募集などを行う際に利用することを想定しています。
募集の掲載、編集、削除や、自分やチームのプロフィールページを作成できます。

# 開発環境

Ruby / Ruby on Rails / React.js / Material-UI / AWS (EC2, RDS, VPC, Route53) / Docker / MySQL / GitHub / Visual Studio Code
開発期間：約 4 週間 (2020/12/18~)

# ペルソナ

- 年齢: 10 代 ~ 30 代
- 職業: 学生、社会人、その他
- 趣味: ゲーム(FPS)

# 課題

## ゲーマー同士のつながりを作る

- ゲーム内で新しい関係を作ることは、何かきっかけがないと意外と難しいです。
  このアプリケーションを利用してもらうことで、気軽に新しいつながりを作れるようにします。
  また、ユーザーのプロフィール表示や、募集へのタグ付けなどによって情報を整理し、長期間持続できる関係を作りやすい環境を目指します。

## 近いスキルレベルレベル同士でプレイする

- 学校の友人や、会社の同僚と一緒にゲームをする機会は多いですが、FPS などの競技性の高いゲームをプレイしていると、どうしてもプレイ時間やモチベーションによって、プレイヤーのスキルレベルに差が出てしまいます。そういった場合に同じレベルのプレイヤーを手軽に探せるサービスを目指します。

# 実装機能

### ユーザー管理機能

- ユーザー登録を行い、情報をユーザーと紐付けて整理します。

### フレンド募集機能

- ゲーム内でのフレンドや、Discord 等のコミュニケーションツール上のフレンドなどを募集できます。

### パーティー募集機能

- 一緒にプレイするパーティーメンバーを募集できます。

### チームメンバー募集機能

- チーム設立者が一緒に活動するメンバーを募集できます。

### スカウト募集機能

- チームに参加したいユーザーが、チームからのスカウトを募集できます。

### 投稿編集・削除機能

- 募集情報の更新、削除が可能です。

### LP

- 最新の募集の掲載や、利用したくなるような雰囲気作りをすることで、ユーザー数の増加を狙います。

### プロフィール機能

- ユーザーのプロフィールを掲載するページです。

### マイデスクページ

- 自分のプレイ環境を掲載するマイデスクページです。

  #### 画像投稿機能

  - デスク画像を投稿するための機能です。

### マイチーム機能

- チームのプロフィールを掲載するページです。

### SNS 認証 (Twitter, Google)

- 登録を簡単にしてユーザー数を増やすことで募集件数を増加させ、 UX の向上へつなげます。

### タグ機能

- 募集にタグを付与することにより、募集の性質をわかりやすくします。

### 単体テスト機能

- アプリケーション運用の安定性を高めます。

# Table Design

## users table

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| gender_id          | integer |             |
| birthday           | date    |             |
| profile            | text    |             |
| twitter_name       | string  |             |
| twitch_name        | string  |             |
| mildom_name        | string  |             |

## users association

- has_one :desk
- has_many :friends
- has_many :parties
- has_many :myteams
- has_many :scouts
- has_many :teams
- has_many :sns_credentials

## desks table

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| desk_text | text       | null: false                    |

## desks association

- has_one_attached: image
- belongs_to :user

## myteams table

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| team_name    | string     | null: false                    |
| team_profile | text       | null: false                    |

## myteams association

- belongs_to :user
- has_many :teams

## friends table

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| friend_title   | string     | null: false                    |
| frined_game_id | string     | null: false                    |
| friend_text    | text       | null: false                    |

## friends association

- belongs_to :user
- has_many :friend_tag_relations, dependent: :destroy
- has_many :friend_tags, through: :friend_tag_relations, dependent: :destroy

## parties table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| party_title   | string     | null: false                    |
| party_game_id | string     | null: false                    |
| party_text    | text       | null: false                    |

## parties association

- belongs_to :user
- has_many :party_tag_relations, dependent: :destroy
- has_many :party_tags, through: :party_tag_relations, dependent: :destroy

## team table

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| myteam_id    | references | null: false, foreign_key: true |
| team_title   | string     | null: false                    |
| team_game_id | string     | null: false                    |
| team_text    | text       | null: false                    |

## teams association

- belongs_to :user
- belongs_to :myteam
- has_many :team_tag_relations, dependent: :destroy
- has_many :team_tags, through: :team_tag_relations, dependent: :destroy

## scouts table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| scout_title   | string     | null: false                    |
| scout_game_id | string     | null: false                    |
| scout_text    | text       | null: false, foreign_key: true |

## scouts association

- belongs_to :user
- has_many :scout_tag_relations, dependent: :destroy
- has_many :scout_tags, through: :scout_tag_relations, dependent: :destroy

## friend_tags table

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

## friend_tags association

- has_many :friend_tag_relations, dependent: :destroy
- has_many :friends, through: :friend_tag_relations, dependent: :destroy

## friend_tag_relations table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| friend_id     | references | null: false, foreign_key: true |
| friend_tag_id | references | null: false, foreign_key: true |

## friend_tag_relations association

- belongs_to :friend
- belongs_to :friend_tag

## friend_tags table

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

## friend_tags association

- has_many :friend_tag_relations, dependent: :destroy
- has_many :friends, through: :friend_tag_relations, dependent: :destroy

## friend_tag_relations table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| friend_id     | references | null: false, foreign_key: true |
| friend_tag_id | references | null: false, foreign_key: true |

## friend_tag_relations association

- belongs_to :friend
- belongs_to :friend_tag

## party_tags table

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

## party_tags association

- has_many :party_tag_relations, dependent: :destroy
- has_many :parties, through: :party_tag_relations, dependent: :destroy

## party_tag_relations table

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| party_id     | references | null: false, foreign_key: true |
| party_tag_id | references | null: false, foreign_key: true |

## party_tag_relations association

- belongs_to :party
- belongs_to :party_tag

## team_tags table

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

## team_tags association

- has_many :team_tag_relations, dependent: :destroy
- has_many :teams, through: :team_tag_relations, dependent: :destroy

## team_tag_relations table

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| team_id     | references | null: false, foreign_key: true |
| team_tag_id | references | null: false, foreign_key: true |

## team_tag_relations association

- belongs_to :team
- belongs_to :team_tag

## scout_tags table

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

## scout_tags association

- has_many :scout_tag_relations, dependent: :destroy
- has_many :scouts, through: :scout_tag_relations, dependent: :destroy

## scout_tag_relations table

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| scout_id     | references | null: false, foreign_key: true |
| scout_tag_id | references | null: false, foreign_key: true |

## scout_tag_relations association

- belongs_to :scout
- belongs_to :scout_tag
