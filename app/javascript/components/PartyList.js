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
              category = "PARTY"
              editUrl = "parties"
              id = { post.id }
              currentUserId = { userId }
              postUserId = { post.user_id }
              title = { post.party_title }
              gameId = { post.party_game_id }
              text = { post.party_text }
            />
          )
        })}
        </div>
    );
  }
}

export default RecruitmentList
