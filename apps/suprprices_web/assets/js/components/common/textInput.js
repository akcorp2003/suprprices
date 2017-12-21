import React from 'react';
import PropTypes from 'prop-types';

export default class TextInput extends React.Component {
    render() {
        var wrapperClass = 'form-group';
        if( this.props.error && this.props.error.length > 0) {
            wrapperClass += " " + "has-error";
        }

        return (
            <div className={wrapperClass}>
                <label htmlFor={this.props.name}>{this.props.label}</label>
                <div className="field">
                    <input type="text"
                            name={this.props.name}
                            className="form-control"
                            placeholder={this.props.placeholder}
                            ref={this.props.name}
                            value={this.props.value} />
                    <div className="input">{this.props.error}</div>
                </div>
            </div>

        );
    }
}

TextInput.propTypes = {
    name: React.PropTypes.string.isRequired,
    label: React.PropTypes.string.isRequired,
    placeholder: React.PropTypes.string,
    value: React.PropTypes.string,
    error: React.PropTypes.string
};