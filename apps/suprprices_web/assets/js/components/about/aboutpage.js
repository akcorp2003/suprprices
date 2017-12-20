import React from 'react';
import MainHeader from '../common/MainHeader';

export default class AboutPage extends React.Component {
    render() {
      return (<div >
                <h1>About</h1>
                <p> 
                    This application is about finding the cheapest grocery item in your area.

                </p>
                <p>
                    The following technologies are used:
                    <ul>
                        <li>React</li>
                        <li>React Router</li>
                        <li>Redux</li>
                        <li>Phoenix</li>
                        <li>Elixir</li>
                        <li>PostgreSQL</li>
                    </ul>
                </p>
                
            </div>)
    }
}