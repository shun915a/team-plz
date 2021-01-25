import React, { useState, useEffect } from 'react';
import Link from '@material-ui/core/Link';
import Button from '@material-ui/core/Button';
import DeleteIcon from '@material-ui/icons/Delete';
import EditIcon from '@material-ui/icons/Edit';
import Modal from "react-modal";
import { jsx, css, ClassNames } from '@emotion/react'

Modal.setAppElement("#root");

export default function RecruitmentItem(props) {
  const [modalIsOpen, setIsOpen] = React.useState(false);

  let editButton;
  if (props.currentUserId == props.postUserId) {
    editButton = (
      <Button 
        variant="contained"
        color="secondary" 
        size="large"
        startIcon={<EditIcon />}
        href={`/${props.editUrl}/${props.id}/edit`}
      >
        EDIT
      </Button>
    )
  }
  
  let deleteButton;
  if (props.currentUserId == props.postUserId) {

    deleteButton = (
      <Button
        variant="outlined"
        color="inherit"
        size="large"
        data-method="delete"
        startIcon={<DeleteIcon />}
        href={`/${props.editUrl}/${props.id}`}
      >
        DELETE
      </Button>
    )
  }

  const tagProps = props.tags;
  const tagList = tagProps.map((tag) =>
    <span className="tag" key={tag.id}>{tag.name}</span>
  );

  useEffect(() => {
    // Update the document title using the browser API
    if (modalIsOpen){
      document.body.style.overflow = 'hidden';
    } 

    if (!modalIsOpen){
      document.body.style.overflow = 'unset';
    } 
  });



  let modal = (
    <ClassNames>
      {({ css, cx }) => (
        <Modal 
          isOpen={modalIsOpen}
          onRequestClose={() => setIsOpen(false)}
          overlayClassName={{
            base: "overlay-base",
            afterOpen: "overlay-after",
            beforeClose: "overlay-before"
          }}
          className={{
            base: "content-base",
            afterOpen: "content-after",
            beforeClose: "content-before"
          }}
          closeTimeoutMS={500}
          portalClassName={css`
            .overlay-base {
              padding: 1rem;
              position: fixed;
              top: 0;   
              bottom: 0;
              right: 0;
              left: 0;
              background-color: rgba(0, 0, 0, 0);
              opacity: 0;
              transition-property: background-color, opacity;
              transition-duration: 200ms;
              transition-timing-function: ease-in-out;
              outline: 0;
              display: flex;
              justify-content: center;
              align-items: center;
            }

            .overlay-after {
              background-color: rgba(0, 0, 0, 0.8);
              opacity: 1;
            }

            .overlay-before {
              background-color: rgba(0, 0, 0, 0);
              opacity: 0;
            }

            .content-base {
              margin: 0 auto;
              border: 0;
              outline: 0;
              display: flex;
              justify-content: center;
              align-items: center;
              height: 0%;
              width: 0%;
              background-color: transparent;
            }

            .content-after {
            }

            .content-before {
              width: 0%;
              height: 0%;
              background-color: transparent;
            }
          `}
        >
            <div className='modal-inner'>
              <div className='modal-header'>{props.category}</div>
              <div className='modal-introduction'>

                <div className='modal-item-title'>
                  <p className='label-text'>
                    TITLE:
                  </p>
                  {props.title}
                </div>

                <Link
                  color="inherit"
                  href={`/users/${props.postUserId}`}
                >
                  <div className='modal-item-game-id'>
                    <p className='label-text'>NAME:</p>
                    {props.gameId}
                  </div>
                </Link>

                <div className="modal-item-title">
                  <p className="label-text">
                    TAGS:
                  </p>
                  {tagList}
                </div>

                <div className='modal-item-text'>
                  <p className='label-text'>DESCRIPTION:</p>
                  {props.text}
                </div>
              </div>
              <div className="modal-btn-container">

                {editButton}
                {deleteButton}

                <Button 
                  variant="contained"
                  size="large"
                  color="default"
                  onClick={() => setIsOpen(false)} 
                >
                  CLOSE
                </Button>
              </div>
            </div>
        </Modal>
      )}
    </ClassNames>
  )

  return (
    <React.Fragment>  
      <div 
        key={props.id}
        className="list"
        onClick={() => setIsOpen(true)}
      >
        <div className="item-title">
          <h3>{props.title}</h3>
          <span className="category">{props.category}</span>
        </div>

        <div className="item-info">

          <div className="tag-container">
            {tagList}
          </div>

          <div className="item-game-id">
            {props.gameId}
          </div>

          <div className="item-text">
            {props.text}
          </div>
        </div>
      </div>
      {modal}
    </React.Fragment>
  );
}