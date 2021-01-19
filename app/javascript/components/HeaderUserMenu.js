import React from 'react';
import Button from '@material-ui/core/Button';
import Menu from '@material-ui/core/Menu';
import MenuItem from '@material-ui/core/MenuItem';
import ExpandMoreIcon from '@material-ui/icons/ExpandMore';

export default function HeaderUserMenu(props) {
  const [anchorEl, setAnchorEl] = React.useState(null);

  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = () => {
    setAnchorEl(null);
  };

  return (
    <div>
      <Button aria-controls="simple-menu" aria-haspopup="true" onClick={handleClick}>
        <p className="user-nickname">{props.name}<ExpandMoreIcon color="secondary" fontSize="large" /></p> 
      </Button>
      <Menu
        color="primary"
        id="simple-menu"
        anchorEl={anchorEl}
        keepMounted
        open={Boolean(anchorEl)}
        onClose={handleClose}
      >
        <MenuItem onClick={handleClose}>
          <a href={`/users/${props.uid}`}>Profile</a>
        </MenuItem>
        
        <MenuItem onClick={handleClose} >
          <a href="/users/sign_out" data-method="delete">Logout</a>
        </MenuItem>
      </Menu>
    </div>
  );
}