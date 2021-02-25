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
    transaction do
      save
      PartyMember.create(user_id: user.id, party_id: id, role: 1)
    end
  end
end
