import React from 'react';
import MainHeader from '../common/MainHeader'

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
                    </div>
                </div>
                );
      }
}