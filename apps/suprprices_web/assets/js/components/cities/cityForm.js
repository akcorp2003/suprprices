import React from 'react';

export default class CityForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {value: ''};
    }

    /* This needs to be fixed. */
    render() {
        return (
            <div>
                <div className="container text-center">
                    <h1>Manage Cities</h1>
                </div>
                <div className="container">
                    <form>
                        <div className="form-group">
                            <label htmlFor="cityname">City Name: </label>
                            <input type="text" className="form-control" id="cityname" aria-describedby="cityname" placeholder="Enter name of city" />
                        </div>
                        <div className="form-group">
                            <label htmlFor="cityname">State: </label>
                            <select className="form-control">
                                <option>Alabama AL</option>
                                <option>Alaska AK</option>
                                <option>Arizona	AZ</option>
                                <option>Arkansas AR</option>
                                <option>California CA</option>
                                <option>Colorado CO</option>
                                <option>Connecticut	CT</option>
                                <option>Delaware DE</option>
                                <option>District of Columbia DC</option>
                                <option>Florida	FL</option>
                                <option>Georgia GA</option>
                                <option>Hawaii HI</option>
                                <option>Idaho ID</option>
                                <option>Illinois IL</option>
                                <option>Indiana	IN</option>
                                <option>Iowa IA</option>
                                <option>Kansas KS</option>
                                <option>Kentucky KY</option>
                                <option>Louisiana LA</option>
                                <option>Maine ME</option>
                                <option>Maryland MD</option>
                                <option>Massachusetts MA</option>
                                <option>Michigan MI</option>
                                <option>Minnesota MN</option>
                                <option>Mississippi MS</option>
                                <option>Missouri MO</option>
                                <option>Montana MT</option>
                                <option>Nebraska NE</option>
                                <option>Nevada NV</option>
                                <option>New Hampshire NH</option>
                                <option>New Jersey NJ</option>
                                <option>New Mexico NM</option>
                                <option>New York NY</option>
                                <option>North Carolina NC</option>
                                <option>North Dakota ND</option>
                                <option>Ohio OH</option>
                                <option>Oklahoma OK</option>
                                <option>Oregon OR</option>
                                <option>Pennsylvania PA</option>
                                <option>Rhode Island RI</option>
                                <option>South Carolina SC</option>
                                <option>South Dakota SD</option>
                                <option>Tennessee TN</option>
                                <option>Texas TX</option>
                                <option>Utah UT</option>
                                <option>Vermont VT</option>
                                <option>Virginia VA</option>
                                <option>Washington WA</option>
                                <option>West Virginia WV</option>
                                <option>Wisconsin WI</option>
                                <option>Wyoming WY</option>
                            </select>
                        </div>
                        <button type="submit" className="btn btn-primary">Submit</button>
                    </form>
                </div>

            </div>
        );
    }
}