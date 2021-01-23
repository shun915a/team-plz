import React from "react"
import RecruitmentItem from "./RecruitmentItem"


class ScoutList extends React.Component {
  render () {
    const post = this.props.post
    const tags = this.props.tags
    const userId = this.props.userId

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
