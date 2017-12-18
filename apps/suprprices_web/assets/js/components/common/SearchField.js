import React from 'react';
import { Link } from 'react-router-dom'

export default class SearchField extends React.Component {
    render() {
        return (
            <div className="col-md-4">
                <div className="input-group">
                    <input type="text" className="form-control" placeholder={this.props.placeholderText} aria-describedby="sizing-addon2" />
                    <span className="input-group-btn">
                        <Link to={this.props.linkTo} style={{ textDecoration: 'none' }}>
                            <button type="button" className="btn btn-default">
                                @
                            </button>
                        </Link>
                    </span>
                </div>
            </div>
        );
    }
}