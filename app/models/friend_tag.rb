class FriendTag < ApplicationRecord
  has_many :friend_tag_relations, dependent: :destroy
  has_many :friends, through: :friend_tag_relations, dependent: :destroy
end
