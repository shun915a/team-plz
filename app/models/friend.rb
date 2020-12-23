class Friend < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :friend_title
    validates :friend_game_id
    validates :friend_text
  end
end
