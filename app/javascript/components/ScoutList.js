import React from "react"
import RecruitmentItem from "./RecruitmentItem"

export default function ScoutList(props) {
  const post = props.post
  const tags = props.tags
  const userId = props.userId

    return (
        <RecruitmentItem key = {post.id}
          category = "SCOUT"
          editUrl = "scouts"
          id = { post.id }
          currentUserId = { userId }
          postUserId = { post.user_id }
          title = { post.scout_title }
          gameId = { post.scout_game_id }
          tags = { tags }
          text = { post.scout_text }
        />
    );
  }
}

export default ScoutList
