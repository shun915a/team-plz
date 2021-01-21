class ScoutTag < ApplicationRecord
  has_many :scout_tag_relations, dependent: :destroy
  has_many :scouts, through: :scout_tag_relations, dependent: :destroy
end
