import React from "react"
import PropTypes from "prop-types"
import RecruitmentItem from "./recruitment_item"


class RecruitmentList extends React.Component {
  render () {
    const posts = this.props.posts
    const userId = this.props.userId

    return (
        <div className="item-lists">

        { posts.map((post) => {
          return (
            <RecruitmentItem key = {post.id}
              category = "friend"
              id = { post.id }
              currentUserId = { userId }
              postUserId = { post.user_id }
              title = { post.friend_title }
              gameId = { post.friend_game_id }
              text = { post.friend_text }
            />
          )
        })}
        </div>
    );
  }
}

export default RecruitmentList
