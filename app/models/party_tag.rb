class PartyTag < ApplicationRecord
  has_many :party_tag_relations, dependent: :destroy
  has_many :parties, through: :party_tag_relations, dependent: :destroy
end
