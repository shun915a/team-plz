class Scout < ApplicationRecord
  belongs_to :user
  has_many :scout_tag_relations, dependent: :destroy
  has_many :scout_tags, through: :scout_tag_relations, dependent: :destroy

  with_options presence: true do
    validates :scout_title
    validates :scout_game_id
    validates :scout_text
  end
end
