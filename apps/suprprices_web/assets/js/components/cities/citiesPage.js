import React from 'react';

export default class CitiesPage extends React.Component {
    getInitialState() {
        cities: []
    }

    componentWillMount() {
        this.setState({ cities: null}); //make callout to api here?
    }

    render() {
        return (<div className="jumbotron">
                  <h1>Suprprices</h1>
                  <p> Find the cheapest grocery around town!</p>
                  <p> Here is the cities!</p>
              </div>)
      }
}