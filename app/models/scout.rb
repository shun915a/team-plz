class Scout < ApplicationRecord
  belongs_to :user
  
  with_options presence: true do
    validates :sout_title
    validates :sout_game_id
    validates :sout_text
  end
end
