import React from "react"
import PropTypes from "prop-types"
class RecruitmentList extends React.Component {
  render () {
    const posts = this.props.posts
    console.log(posts)
    posts.map((post) => {
      console.log(post.id)
    })

    return (
      <React.Fragment>
        { posts.map((post) => {
        })}
        <li className="list">
          <div className="item-title">
            <h3>friend title</h3>
            <span className="category">FRIEND</span>
          </div>

          <div className="item-info">
            <div className="item-game-id">
              friend_game_id
            </div>

            <div className="item-text">
              friend_text
            </div>
          </div>
        </li>
      </React.Fragment>
    );
  }
}

export default RecruitmentList
