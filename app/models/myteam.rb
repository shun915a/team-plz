class Myteam < ApplicationRecord
  belongs_to :user
  has_many :teams

  with_options presence: true do
    validates :team_name
    validates :team_profile
  end
end
