import React from "react"
import PropTypes from "prop-types"
import RecruitmentItem from "./RecruitmentItem"


class RecruitmentList extends React.Component {
  render () {
    const posts = this.props.posts

    return (
        <div className="item-lists">

        { posts.map((post) => {
          return (
            <RecruitmentItem key = {post.id}
              category = "friend"
              id = { post.id }
              title = { post.friend_title }
              game_id = { post.friend_game_id }
              text = { post.friend_text }
            />
          )
        })}
        </div>
    );
  }
}

export default RecruitmentList
