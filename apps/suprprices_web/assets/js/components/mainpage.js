import React from 'react';
import MainHeader from './common/MainHeader';
import SearchField from './common/SearchField';
import { Link } from 'react-router-dom';

export default class MainPage extends React.Component {
    render() {
      return (
            <div>
                <div className="container text-center">
                  <h1>Find the cheapest groceries in town!</h1>
                </div>
                <br /><br /><br />
                <div className="container">
                    <div className="row text-center">
                        <SearchField placeholderText="Search by City" linkTo="cities" />
                        <SearchField placeholderText="Search by Store" linkTo="stores" />
                        <SearchField placeholderText="Search by Product" linkTo="groceries" />
                    </div>
                </div>
            </div>
        );
    }
}

//