import React from "react"
import RecruitmentItem from "./RecruitmentItem"


class RecruitmentList extends React.Component {
  render () {
    const post = this.props.post
    const tags = this.props.tags
    const userId = this.props.userId

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
}

export default RecruitmentList
