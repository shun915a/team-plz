class PartyMember < ApplicationRecord
  belongs_to :party
  belongs_to :user

  enum role: { free: 0, manager: 1, member: 2 }

  with_options presence: true do
    validates :user_id
    validates :party_id
  end
end
