class Myteam < ApplicationRecord
  belongs_to :user
  has_many :teams

  with_options presence: true do
    validates :tam_name
    validates :tam_profile
  end
end
