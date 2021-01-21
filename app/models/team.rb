class Team < ApplicationRecord
  belongs_to :user
  belongs_to :myteam
  has_many :team_tag_relations, dependent: :destroy
  has_many :team_tags, through: :team_tag_relations, dependent: :destroy

  with_options presence: true do
    validates :team_title
    validates :team_game_id
    validates :team_text
  end
end
