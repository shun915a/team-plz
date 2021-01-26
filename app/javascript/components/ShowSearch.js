import React, { useState, useEffect } from 'react';
import Button from '@material-ui/core/Button';
import { jsx, css, ClassNames } from '@emotion/react'

export default function ShowSearch() {
  const [searchIsOpen, setIsOpen] = React.useState(false);
  let closeButton;


  useEffect(() => {
    // Update the document title using the browser API
    if (searchIsOpen){
      document.body.style.overflow = 'hidden';

      {console.log("open")}
      {css`
        .search-section {
          display: inline;
        }
        .css-text {
          color: red;
        }
      `}

    } 

    if (!searchIsOpen){
      {console.log("close")}
      document.body.style.overflow = 'unset';
      {css`
        .search-section {
          display: none;
        }
        .css-text {
          color: white;
        }
      `}

    } 
  });


  return (
    <React.Fragment>
      <p
        onClick={() => setIsOpen(true)}
      >
        !Search
      </p>
      <p
        onClick={() => setIsOpen(false)}
      >
        !Close
      </p>
      <p class="css-test">TESTTEXT</p>

    </React.Fragment>
  )
}