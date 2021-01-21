class FriendTagRelation < ApplicationRecord
  belongs_to :friend
  belongs_to :friend_tag
end
