class Party < ApplicationRecord
  belongs_to :user
  has_many :party_members
  has_many :party_tag_relations, dependent: :destroy
  has_many :party_tags, through: :party_tag_relations, dependent: :destroy

  with_options presence: true do
    validates :party_title
    validates :party_game_id
    validates :party_text
  end

  def new_party
    ApplicationRecord.transaction do
      save!
      PartyMember.create!(user_id: user.id, party_id: id, role: :manager, status: :accept)
      true
    rescue ActiveRecord::RecordInvalid
      false
    end
  end
end
