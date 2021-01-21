class FriendForm
  include ActiveModel::Model
  attr_accessor :friend_title, :friend_game_id, :friend_text, :tag_id

  with_options presence: true do
    validates :friend_title
    validates :friend_game_id
    validates :friend_text
    validates :tag_id
  end

  def save
    friend = Friend.create(
      friend_title: friend_title,
      friend_game_id: friend_game_id,
      friend_text: friend_text
    )
    FriendTagRelation.create(
      friend_id: friend.id,
      tag_id: tag_id
    )
  end
end
