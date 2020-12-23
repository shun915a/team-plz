class Scout < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :scout_title
    validates :scout_game_id
    validates :scout_text
  end
end
