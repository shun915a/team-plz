class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender

  has_one :desk
  has_many :friends
  has_many :parties
  has_many :scouts
  has_many :myteams
  has_many :teams

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Password must includes letter and number.', on: :create

  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Password must includes letter and number.', on: :update, allow_blank: true

  with_options presence: true do
    validates :nickname, length: { minimum: 4, maximum: 25, message: 'must be 4 - 25 characters.' }
  end

  validates :gender_id, inclusion: { in: 1..3, message: 'must be 1 - 3.' }

  with_options format: { with: /\A[a-zA-Z0-9]/, message: 'must be half-width characters.' } do
    validates :twitter_name, length: { minimum: 4, maximum: 15, message: 'must be 4 - 15 characters.' }
    validates :twitch_name, length: { minimum: 4, maximum: 25, message: 'must be 4 - 25 characters.' }
  end

  validates :mildom_name, numericality: { only_integer: true, message: 'must be half-width numbers.' }
end
