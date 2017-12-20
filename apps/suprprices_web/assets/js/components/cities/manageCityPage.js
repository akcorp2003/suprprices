import React from 'react';
import MainHeader from '../common/MainHeader'

export default class ManageCitiesPage extends React.Component {
    getInitialState() {
        cities: []
    }

    componentWillMount() {
        this.setState({ cities: null }); //make callout to api here?
    }

    render() {
        return (
            <div>
                <MainHeader />
                <div className="container text-center">
                    <h1>Manage Cities</h1>
                </div>
            </div>
        );
    }
}