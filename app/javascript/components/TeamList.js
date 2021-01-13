import React from "react"
import RecruitmentItem from "./RecruitmentItem"


class RecruitmentList extends React.Component {
  render () {
    const posts = this.props.posts
    const userId = this.props.userId

    return (
        <div className="item-lists">

        { posts.map((post) => {
          return (
            <RecruitmentItem key = {post.id}
              category = "TEAM"
              editUrl = "teams"
              id = { post.id }
              currentUserId = { userId }
              postUserId = { post.user_id }
              title = { post.team_title }
              gameId = { post.team_game_id }
              text = { post.team_text }
            />
          )
        })}
        </div>
    );
  }
}

export default RecruitmentList
