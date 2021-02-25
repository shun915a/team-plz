class PartyMember < ApplicationRecord
  belongs_to :party
  belongs_to :user

  enum role: { free: 0, manager: 1, member: 2 }
end
