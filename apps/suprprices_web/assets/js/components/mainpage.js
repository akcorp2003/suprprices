import React from 'react';
import MainHeader from './MainHeader'

export default class MainPage extends React.Component {
    render() {
      return (
            <div>
                <MainHeader />
                <div className="container text-center">
                  <h1>Find the cheapest groceries in town!</h1>
                </div>
                <br /><br /><br />
                <div className="container">
                    <div className="row text-center">
                        <div className="col-md-4">
                            <div className="input-group">
                                <span className="input-group-addon">@</span>
                                <input type="text" className="form-control" placeholder="Search by City" aria-describedby="sizing-addon2" />
                            </div>

                        </div>
                        <div className="col-md-4">
                            <div className="input-group">
                                <span className="input-group-addon">@</span>
                                <input type="text" className="form-control" placeholder="Search by Store" aria-describedby="sizing-addon2" />
                            </div>
                        </div>
                        <div className="col-md-4">
                            <div className="input-group">
                                <span className="input-group-addon">@</span>
                                <input type="text" className="form-control" placeholder="Search by Product" aria-describedby="sizing-addon2" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

//