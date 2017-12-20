import React from 'react';
import MainHeader from './common/MainHeader';

export default class notFoundPage extends React.Component {
    render() {
        return (
            <div>
                <MainHeader />
                <div className="container text-center">
                    <h1>Oh no! 404</h1>
                    <br />
                    <h1>This page doesn't exist.</h1>
                </div>
            </div>
        );
    }
}
