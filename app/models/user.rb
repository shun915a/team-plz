class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender

  has_one :desk
  has_many :friends
  has_many :parties
  has_many :scouts
  has_many :myteams
  has_many :teams
  has_many :sns_credentials

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: %i[twitter google_oauth2]

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
      nickname: auth.info.nickname,
      email: auth.info.email,
      image: auth.info.image
    )

    # userが登録済みか判定
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Password must includes letter and number.', on: :create

  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Password must includes letter and number.', on: :update, allow_blank: true

  with_options presence: true do
    validates :nickname, length: { maximum: 25, message: 'must be 1 - 25 characters.' }
  end

  validates :gender_id, inclusion: { in: 1..3, message: 'must be 1 - 3.' }, allow_blank: true

  with_options allow_blank: true, format: { with: /\A[a-zA-Z0-9]/, message: 'must be half-width characters.' } do
    validates :twitter_name, length: { minimum: 4, maximum: 15, message: 'must be 4 - 15 characters.' }
    validates :twitch_name, length: { minimum: 4, maximum: 25, message: 'must be 4 - 25 characters.' }
  end

  validates :mildom_name, numericality: { only_integer: true, message: 'must be half-width numbers.' }, allow_blank: true

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
