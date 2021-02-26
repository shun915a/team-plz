class PartyMember < ApplicationRecord
  belongs_to :party
  belongs_to :user

  enum role: { free: 0, manager: 1, member: 2 }
  enum status: { request: 0, accept: 1, decline: 2 }

  with_options presence: true do
    validates :user_id
    validates :party_id
  end

  def accept_request
    if request?
      accept!
      member!
    end
  end

  def decline_request
    decline! if request?
  end
end
