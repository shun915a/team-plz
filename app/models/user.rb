class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender

  has_one :desk
  has_many :friends
  has_many :parties
  has_many :scouts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Password must includes letter and number.', on: :create

  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Password must includes letter and number.', on: :update, allow_blank: true

  with_options presence: true do
    validates :nickname, length: { minimum: 3, maximum: 16, message: '3〜16文字で入力してください。' }
  end
end
