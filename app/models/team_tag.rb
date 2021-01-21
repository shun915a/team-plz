class TeamTag < ApplicationRecord
  has_many :team_tag_relations, dependent: :destroy
  has_many :teams, through: :team_tag_relations, dependent: :destroy
end
