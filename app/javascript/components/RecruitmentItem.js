import React from "react"
import Link from '@material-ui/core/Link';
import Button from '@material-ui/core/Button';
import Icon from '@material-ui/core/Icon';
import DeleteIcon from '@material-ui/icons/Delete';
import EditIcon from '@material-ui/icons/Edit';

import { makeStyles } from '@material-ui/core/styles';


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
        <Button 
          variant="contained"
          color="secondary" 
          size="large"

          startIcon={<EditIcon />}
        >
          <a 
            href={`/${this.props.editUrl}/${this.props.id}/edit`}
          >
            EDIT
          </a>
        </Button>
      )
    }
    
    let deleteButton;
    if (this.props.currentUserId == this.props.postUserId) {

      deleteButton = (
        <Button
          variant="contained"
          color="primary"
          size="large"


          startIcon={<DeleteIcon />}
        >
          <a 
            href={`/${this.props.editUrl}/${this.props.id}`}
            data-method="delete"
          >
            DELETE
          </a>
        </Button>
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

              <Link
                color="inherit"
                href={`/users/${this.props.postUserId}`}
              >
                <div className='modal-item-game-id'>
                  <p className='label-text'>NAME:</p>
                  {this.props.gameId}
                </div>
              </Link>

              <div className='modal-item-text'>
                <p className='label-text'>DESCRIPTION:</p>
                {this.props.text}
              </div>
            </div>
            <div className="modal-btn-container">
              {editButton}
              {deleteButton}
              <Button 
                variant="contained"
                size="large"
                color="default"
                onClick={() => this.handleClickClose()}
              >
                CLOSE
              </Button>
            </div>
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
            <span className="category">{this.props.category}</span>
          </div>

          <div className="item-info">

            <div className="item-game-id">
              {this.props.gameId}
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


