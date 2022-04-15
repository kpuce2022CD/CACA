import React, { Component } from 'react'
import userService from './userService.js';
import { BrowserRouter, Route, Link, Routes, useNavigate } from 'react-router-dom';

class Update_about_user extends Component {
    constructor(props) {
        super(props)
        this.state = {
            about: ''
        }
    }

    componentDidMount() {
        userService.updateAbout(this.state.about).then((res) => {
            this.setState({ about: res.data });
        });
    }

    updateAbout = (e) => {
        e.preventDefault();

        console.log('about => ' + this.state.about);
        fetch("http://localhost:8085/user_about?about=" + this.state.about, {
            method: "POST",
            headers: new Headers({
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }),
        })
    }

    changeAboutHandler = (event) => {
        this.setState({ about: event.target.value });
    }

    render() {
        return (
            <div>
                <div className="form-group">
                    <label>Edit</label>
                    <textarea className="form-control" rows="25" placeholder="Enter your message" value={this.state.about} onChange={this.changeAboutHandler}></textarea>
                </div>
                <button type="submit" className="btn btn-primary btn-lg" onClick={this.updateAbout}>Save</button>
            </div>
        )
    }
}

export default Update_about_user;
