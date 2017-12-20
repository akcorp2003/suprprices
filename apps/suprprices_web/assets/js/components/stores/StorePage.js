import React from 'react';
import MainHeader from '../common/MainHeader';

export default class StoresPage extends React.Component {
    getInitialState() {
        stores: []
    }

    componentWillMount() {
        this.setState({ stores: null }); //make callout to api here?
    }

    render() {
        return (
            <div>
                <div className="container text-center">
                    <h1>Here are the stores!</h1>
                </div>
            </div>
        );
    }
}