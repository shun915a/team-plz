class Team < ApplicationRecord
  belongs_to :user
  belongs_to :myteam

  with_options presence: true do
    validates :team_title
    validates :team_game_id
    validates :team_text
  end
end
