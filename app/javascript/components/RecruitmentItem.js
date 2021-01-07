import React from "react"
import PropTypes from "prop-types"

class RecruitmentItem extends React.Component {
  constructor(props) {
    super(props);
  }
  render () {
    console.log('item loaded')
    return (
      <li className="list">
        <div className="item-title">
          <h3>{this.props.title}</h3>
          <span className="category">FRIEND</span>
        </div>

        <div className="item-info">

          <div className="item-game-id">
            {this.props.game_id}
          </div>

          <div className="item-text">
            {this.props.text}
          </div>
        </div>
      </li>
    );
  }
}

export default RecruitmentItem


