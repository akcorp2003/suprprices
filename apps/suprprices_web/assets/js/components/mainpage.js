import React from 'react';
import {Link} from 'react-router-dom'

export default class MainPage extends React.Component {
    render() {
      return (<div className="jumbotron">
                <h1>Suprprices</h1>
                <p> Find the cheapest grocery around town!</p>
                <Link to="about" className="btn btn-primary btn-lg">About</Link>
            </div>)
    }
}

//