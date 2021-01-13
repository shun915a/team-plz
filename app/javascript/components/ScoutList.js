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
              category = "SCOUT"
              editUrl = "scouts"
              id = { post.id }
              currentUserId = { userId }
              postUserId = { post.user_id }
              title = { post.scout_title }
              gameId = { post.scout_game_id }
              text = { post.scout_text }
            />
          )
        })}
        </div>
    );
  }
}

export default RecruitmentList
