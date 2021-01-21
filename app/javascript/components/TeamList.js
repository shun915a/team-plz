import React from "react"
import RecruitmentItem from "./RecruitmentItem"


class TeamList extends React.Component {
  render () {
    const post = this.props.post
    const tags = this.props.tags
    const userId = this.props.userId

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
}

export default TeamList
