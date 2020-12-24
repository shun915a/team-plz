class Desk < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :desk_text
  end
end
