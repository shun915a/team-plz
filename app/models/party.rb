class Party < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :party_title
    validates :party_game_id
    validates :party_text
  end
end
