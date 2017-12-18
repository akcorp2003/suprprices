import React from 'react';
import MainHeader from '../common/MainHeader'

export default class GroceriesPage extends React.Component {
    getInitialState() {
        groceries: []
    }

    componentWillMount() {
        this.setState({ groceries: null }); //make callout to api here?
    }

    render() {
        return (
            <div>
                <MainHeader />
                <div className="container text-center">
                    <h1>Here are the groceries!</h1>
                </div>
            </div>
        );
    }
}