import React from "react"
import RecruitmentItem from "./RecruitmentItem"


export default function FriendList(props) {
  const post = props.post
  const tags = props.tags
  const userId = props.userId

  return (
    <RecruitmentItem key = {post.id}
      category = "FRIEND"
      editUrl = "friends"
      id = { post.id }
      currentUserId = { userId }
      postUserId = { post.user_id }
      title = { post.friend_title }
      gameId = { post.friend_game_id }
      tags = { tags }
      text = { post.friend_text }
    />
  );
}
