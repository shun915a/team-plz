class PartyTagRelation < ApplicationRecord
  belongs_to :party
  belongs_to :party_tag
end
