class Friend < ApplicationRecord
  belongs_to :user
  has_many :friend_tag_relations, dependent: :destroy
  has_many :friend_tags, through: :friend_tag_relations, dependent: :destroy

  with_options presence: true do
    validates :friend_title
    validates :friend_game_id
    validates :friend_text
  end
end
