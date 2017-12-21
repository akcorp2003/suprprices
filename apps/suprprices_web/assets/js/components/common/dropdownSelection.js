import React from 'react';
import PropTypes from 'prop-types';

export default class DropdownSelection extends React.Component {
    render() {
        var wrapperClass = 'form-group';
        if (this.props.error && this.props.error.length > 0) {
            wrapperClass += " " + "has-error";
        }

        const values = this.props.values;
        const options = values.map((value, index) => {
            return <option key={index}>{value}</option>
        });

        return (
            <div className={wrapperClass}>
                <label htmlFor={this.props.name}>{this.props.label}</label>
                <select className="form-control">
                    {options}
                </select>
            </div>

        );
    }
}

DropdownSelection.propTypes = {
    name: React.PropTypes.string.isRequired,
    label: React.PropTypes.string.isRequired,
    values: React.PropTypes.array.isRequired,
    error: React.PropTypes.string
};