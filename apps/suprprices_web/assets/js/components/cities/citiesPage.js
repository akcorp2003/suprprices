import React from 'react';
import MainHeader from '../common/MainHeader'
import Link from 'react-router-dom/Link';

export default class CitiesPage extends React.Component {
    getInitialState() {
        cities: []
    }

    componentWillMount() {
        this.setState({ cities: null}); //make callout to api here?
    }

    render() {
        return (
                <div>
                    <div className="container text-center">
                        <h1>Here are the cities!</h1>
                        <br />
                        <Link to="city" className="btn btn-primary">Add City</Link>
                    </div>
                </div>
                );
      }
}