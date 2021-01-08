import React from "react"
import PropTypes from "prop-types"

class RecruitmentItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {isModalOpen: false};
  }

  handleClickRecruitment() {
    this.setState({isModalOpen: true});
    console.log(this.state.isModalOpen)
  }

  handleClickClose() {
    this.setState({isModalOpen: false});
    console.log("close modal clicked")
    console.log(this.state.isModalOpen)
  }

  render () {
    let modal;
    if (this.state.isModalOpen) {
      modal = (
        <div className='modal'>
          <div className='modal-inner'>
            <div className='modal-header'></div>
            <div className='modal-introduction'>
              <h2>{this.props.title}</h2>
              <p>{this.props.game_id}</p>
              <p>{this.props.text}</p>
            </div>
            <button
              className='modal-close-btn'
              onClick={() => this.handleClickClose()}
            >
              とじる
            </button>
          </div>
        </div>
      );
    }

    console.log('item loaded')
    return (
      <React.Fragment>  
        <li 
          className="list"
          onClick={() => {this.handleClickRecruitment()}}
        >
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
        {modal}
      </React.Fragment>
    );
  }
}

export default RecruitmentItem


