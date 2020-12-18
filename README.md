# ペルソナ

- 年齢: 15〜30 歳
- 職業: 学生、その他
- 趣味: ゲーム(FPS)

# 課題

- ゲーマー同士のつながりを作る
  学校の友人や、会社の同僚と一緒にゲームをすることは出来るが、FPS などの競技性の高いゲームをプレイしていると、どうしてもプレイ時間やモチベーションによって、プレイヤーのスキルレベルに差が出てしまう。
  そういった場合に同じレベルのプレイヤーを手軽に探せるサービスを作る。

# 必要な機能

- フレンド募集機能
  ゲーム内でのフレンドや、Discord でのフレンドなどを募集する。

- パーティー募集機能
  一時的に一緒にプレイするパーティーメンバーを募集する。

- チームメンバー募集機能
  チームリーダーや、メンバー管理をしているユーザーが、チームとして一緒に活動するメンバーを募集する。

- スカウト募集機能
  チームに参加したいユーザーが、チームを探すために使う募集機能。

- プロフィール機能
  ユーザーのプロフィールを掲載するページ。

- マイデスクページ
  自分のプレイ環境を掲載するマイデスクページ。

- マイチーム機能
  チームのプロフィールを掲載するページ

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

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| email        | string  | null: false |
| nickname     | string  | null: false |
| gender_id    | integer |             |
| birthday     | date    |             |
| profile      | text    |             |
| twitter_name | string  |             |
| twitch_name  | string  |             |
| mildom_id    | string  |             |

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

## teams table

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
