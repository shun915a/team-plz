[](https://i.imgur.com/V41HCTC.png)

# アプリケーション概要

このアプリケーションはゲーマー向け SNS です。
ゲーマーが、一緒にプレイする友達を探したり、チームを作成する際にメンバーの募集などを行う事ができます。
募集の掲載、編集、削除や、自分やチームのプロフィールページを作成出来ます。

# 開発環境

Ruby / Ruby on Rails / React.js / Material-UI / AWS (EC2, RDS, VPC) / Docker / MySQL / GitHub / Visual Studio Code
開発期間：約 4 週間 (2020/12/18~)

# ペルソナ

- 年齢: 10 代 ~ 30 代
- 職業: 学生、社会人、その他
- 趣味: ゲーム(FPS)

# 課題

- ゲーマー同士のつながりを作る
  学校の友人や、会社の同僚と一緒にゲームをすることは出来るが、FPS などの競技性の高いゲームをプレイしていると、どうしてもプレイ時間やモチベーションによって、プレイヤーのスキルレベルに差が出てしまう。そういった場合に同じレベルのプレイヤーを手軽に探せるサービスを作る。

# 必要機能

- ユーザー管理機能
  ユーザー登録を行い、情報を整理する。

- フレンド募集機能
  ゲーム内でのフレンドや、Discord 等のコミュニケーションツール上のフレンドなどを募集する。

- パーティー募集機能
  一緒にプレイするパーティーメンバーを募集する。

- チームメンバー募集機能
  チームが一緒に活動するメンバーを募集する。

- スカウト募集機能
  チームに参加したいユーザーが、チームからのスカウトを募集する。

- 投稿編集・削除機能
  募集情報の更新、削除を行う。

- LP
  最新の募集や、利用したくなるような雰囲気作りをすることで、ユーザー数を増やす。

- プロフィール機能
  ユーザーのプロフィールを掲載するページ。

- マイデスクページ
  自分のプレイ環境を掲載するマイデスクページ。

  - 画像投稿機能
    デスク画像を投稿するため。

- マイチーム機能
  チームのプロフィールを掲載するページ。

- SNS 認証(Twitter, Google)
  募集を掲載するアプリケーションのため、登録を簡単にしてユーザー数を増やすことで UX の向上へつなげる。

- タグ機能
  募集にタグを付与することにより、募集の性質をわかりやすくする。

# 要件定義

## トップページ

【ヘッダー】

- サインイン/ログインページへ遷移出来るボタンがある。
- ログイン時はログアウトボタンがある。
- ログイン時はマイプロフィールページへ遷移できるボタンがある。
- ログイン時かつ自身の所属しているチームページがある場合はチームページへ遷移できるボタンがある。

【サイドバー】

- フレンド募集、パーティー募集、チームメンバー募集、スカウト募集それぞれの一覧ページへ遷移するボタンがある。

【コンテンツ】

- すべての募集が一覧で表示される。
- 募集を作成するページへ遷移するボタンが有る

## フレンド募集 一覧ページ

- フレンド募集が一覧で表示される。
- クリックすると募集の詳細ページへ遷移する。

## フレンド募集 詳細ページ

- ログインしている掲載者の場合、編集と削除ボタンが表示される。
- ログインしているユーザーの場合、コメント欄が表示される。

## フレンド募集 編集ページ

- 募集を編集出来るフォームがある。
- 更新ボタンがある。

## パーティー募集 一覧ページ

- パーティー募集が一覧で表示される。
- クリックすると募集の詳細ページへ遷移する。

## パーティー募集 詳細ページ

- ログインしている掲載者の場合、編集と削除ボタンが表示される。
- ログインしているユーザーの場合、コメント欄が表示される。

## パーティー募集 編集ページ

- 募集を編集出来るフォームがある。
- 更新ボタンがある。

## チームメンバー募集 一覧ページ

- チームメンバー募集が一覧で表示される。
- クリックすると募集の詳細ページへ遷移する。

## チームメンバー募集 詳細ページ

- ログインしている掲載者の場合、編集と削除ボタンが表示される。
- ログインしているユーザーの場合、コメント欄が表示される。

## チームメンバー募集 編集ページ

- 募集を編集出来るフォームがある。
- 更新ボタンがある。

## スカウト募集 一覧ページ

- スカウト募集が一覧で表示される。
- クリックすると募集の詳細ページへ遷移する。

## スカウト募集 詳細ページ

- ログインしている掲載者の場合、編集と削除ボタンが表示される。
- ログインしているユーザーの場合、コメント欄が表示される。

## スカウト募集 編集ページ

- 募集を編集出来るフォームがある。
- 更新ボタンがある。

## マイプロフィールページ

- ユーザーのプロフィールを表示する
- ログインしているユーザーが作成したプロフィールの場合、編集、削除ボタンが表示される。

## マイデスクページ

- ユーザーのデスク画像を表示する
- ログインしているユーザーの場合コメント欄と投稿フォームが表示される

## マイチームページ

- チームのプロフィールを表示する。
- ログインしているユーザーが作成したチームの場合、編集、削除ボタンが表示される。

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
- has_many :myteams
- has_many :friends
- has_many :friend_comments
- has_many :parties
- has_many :party_comments
- has_many :scouts
- has_many :scout_comments
- has_many :teams
- has_many :team_comments

## desks table

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| desk_text | text       | null: false                    |

## desks association

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
- has_many :friend_comments

## friend_comments table

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| friend_comment | text       | null: false                    |
| user_id        | references | null: false, foreign_key: true |
| friend_id      | references | null: false, foreign_key: true |

## friend association

- belongs_to :user
- belongs_to :friend

## parties table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| party_title   | string     | null: false                    |
| party_game_id | string     | null: false                    |
| party_text    | text       | null: false                    |

## parties association

- belongs_to :user
- has_many :party_comments

## party_comments table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| party_comment | text       | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| party_id      | references | null: false, foreign_key: true |

## party_comments association

- belongs_to :user
- belongs_to :party

## scouts table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| scout_title   | string     | null: false                    |
| scout_game_id | string     | null: false                    |
| scout_text    | text       | null: false, foreign_key: true |

## scouts association

- belongs_to :user
- has_many :scout_comments

## scout_comments table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| scout_comment | text       | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| party_id      | references | null: false, foreign_key: true |

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
- has_many :team_comments

## team_comments table

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| team_comment | text       | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| team_id      | references | null: false, foreign_key: true |

## team_comments association

- belongs_to :user
- belongs_to :team
