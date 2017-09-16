import React from 'react';

export default class Header extends React.Component {
    render() {
      return (
        <nav className="navbar navbar-default">
            <div className="container-fluid">
                <a href="/" className="navbar-brand">
                    <img src="../../static/images/phoenix.png" />
                </a>
                <ul className="nav navbar-nav">
                    <li><a href="/">Home</a></li>
                    <li><a href="/#about">About</a></li>
                </ul>
            </div>
      </nav>
      )
    }
}