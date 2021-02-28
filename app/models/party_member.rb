class PartyMember < ApplicationRecord
  belongs_to :party
  belongs_to :user

  enum role: { free: 0, manager: 1, member: 2 }
  enum status: { request: 0, accept: 1, decline: 2 }

  def accept_request
    if request?
      ApplicationRecord.transaction do
        accept!
        member!
      end
    end
  end

  def decline_request
    decline! if request?
  end
end
