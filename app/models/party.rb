class Party < ApplicationRecord
  belongs_to :user
  has_many :party_tag_relations, dependent: :destroy
  has_many :party_tags, through: :party_tag_relations, dependent: :destroy

  with_options presence: true do
    validates :party_title
    validates :party_game_id
    validates :party_text
  end
end
