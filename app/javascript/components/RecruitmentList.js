import React from "react"
import PropTypes from "prop-types"
import RecruitmentItem from "./RecruitmentItem"

class RecruitmentList extends React.Component {
  render () {
    const posts = this.props.posts
    console.log(posts)
    posts.map((post) => {
      console.log(post.id)
    })

    return (
        <div className="item-lists">

        { posts.map((post) => {
          return (
            <RecruitmentItem key = {post.id}
              title = { post.friend_title }
              game_id = { post.friend_game_id }
              text = { post.fiend_text }
            />
          )
        })}
        </div>
    );
  }
}

export default RecruitmentList
