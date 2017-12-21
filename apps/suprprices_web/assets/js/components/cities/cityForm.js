import React from 'react';
import TextInput from '../common/textInput';
import DropdownSelection from '../common/dropdownSelection';

export default class CityForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {value: ''};
    }

    usStates() {
        const states = ["Alabama AL", "Alaska AK", "Arizona AZ", "Arkansas AR", "California CA", "Colorado CO", "Connecticut CT",
            "Delaware DE", "District of Columbia DC", "Florida FL", "Georgia GA", "Hawaii HI", "Idaho ID", "Illinois IL",
            "Indiana IN", "Iowa IA", "Kansas KS", "Kentucky KY", "Louisiana LA", "Maine ME", "Maryland MD",
            "Massachusetts MA", "Michigan MI", "Minnesota MN", "Mississippi MS", "Missouri MO",
            "Montana MT", "Nebraska NE", "Nevada NV", "New Hampshire NH", "New Jersey NJ",
            "New Mexico NM", "New York NY", "North Carolina NC", "North Dakota ND", "Ohio OH",
            "Oklahoma OK", "Oregon OR", "Pennsylvania PA", "Rhode Island RI", "South Carolina SC",
            "South Dakota SD", "Tennessee TN", "Texas TX", "Utah UT", "Vermont VT",
            "Virginia VA", "Washington WA", "West Virginia WV", "Wisconsin WI", "Wyoming WY"];
        
        return states;
    }

    /* This needs to be fixed. */
    render() {
        let usStates = this.usStates();
        return (
            <div>
                <div className="container text-center">
                    <h1>Manage Cities</h1>
                </div>
                <div className="container">
                    <form>
                        <TextInput name="cityname" label="City Name: " placeholder="Enter name of city" />
                        <DropdownSelection name="states" label="State: " values={usStates} />
                        <button type="submit" className="btn btn-primary">Submit</button>
                    </form>
                </div>

            </div>
        );
    }
}