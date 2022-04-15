import React, { Component } from 'react'
import userService from './userService.js';
import { BrowserRouter, Route, Link, Routes, useNavigate } from 'react-router-dom';

class Update_contact_user extends Component {
    constructor(props) {
        super(props)
        this.state = {
            user_email: ''
        }
    }

    componentDidMount() {
        userService.updateEmail(this.state.user_email).then((res) => {
            this.setState({ user_email: res.data });
        });
    }

    updateEmail = (e) => {
        e.preventDefault();

        console.log('email => ' + this.state.user_email);
    fetch("http://localhost:8085/email?user_email="+this.state.user_email, {
      method: "POST",
      headers: new Headers({
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }),
    })
    }

    changeEmailHandler= (event) => {
        this.setState({user_email: event.target.value});
    }

    render() {
        return (
            <div>
                <div className="form-group" >
                <input type="text" className="form-control" name="user_email" placeholder="Your Email" value={this.state.user_email} onChange={this.changeEmailHandler} />
                </div>
                <button type="submit" className="btn btn-primary btn-lg" onClick={this.updateEmail}>Save</button>
            </div>
        )
    }
}

export default Update_contact_user;
