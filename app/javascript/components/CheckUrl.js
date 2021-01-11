import React from "react"
import { BrowserRouter, Route, Link } from 'react-router-dom'

class CheckUrl extends React.Component {
  render () {
    console.log(this.props.showUrl)
    return (
      <BrowserRouter>
        <Link to='/parties'>Parties</Link>
      </BrowserRouter>
    )
  }
}

export default CheckUrl
