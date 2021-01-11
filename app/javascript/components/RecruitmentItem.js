import React from "react"

class RecruitmentItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {isModalOpen: false};
  }

  handleClickRecruitment() {
    this.setState({isModalOpen: true});
  }

  handleClickClose() {
    this.setState({isModalOpen: false});
  }

  
  render () {
    let editButton;
    if (this.props.currentUserId == this.props.postUserId) {
      editButton = (
        <a href={`/friends/${this.props.id}/edit`}>
          <div
            className='modal-close-btn btn'
          >
            EDIT
          </div>
        </a>
      )
    }
    
    let modal;
    if (this.state.isModalOpen) {
      modal = (
        <div className='modal'>
          <div className='modal-inner'>
            <div className='modal-header'>{this.props.category}</div>
            <div className='modal-introduction'>

              <div className='modal-item-title'>
                <p className='label-text'>
                  TITLE:
                </p>
                {this.props.title}
              </div>

              <div className='modal-item-game-id'>
                <p className='label-text'>NAME:</p>
                {this.props.gameId}
              </div>

              <div className='modal-item-text'>
                <p className='label-text'>DESCRIPTION:</p>
                {this.props.text}
              </div>
            </div>
            {editButton}
            <a
              className='modal-close-btn btn'
              onClick={() => this.handleClickClose()}
            >
              CLOSE
            </a>
          </div>
        </div>
      );
    }

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


