import React from "react"
import RecruitmentItem from "./RecruitmentItem"

export default function(props) {
  const post = props.post
  const tags = props.tags
  const userId = props.userId

  return (
    <RecruitmentItem key = {post.id}
      category = "TEAM"
      editUrl = "teams"
      id = { post.id }
      currentUserId = { userId }
      postUserId = { post.user_id }
      title = { post.team_title }
      gameId = { post.team_game_id }
      tags = { tags }
      text = { post.team_text }
    />
  );
}

