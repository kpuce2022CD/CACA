import logo from './logo.svg';
import './App.css';
import React, { useEffect, useState, Component } from 'react';
import Subject from './Subject.jsx';
import userService from './userService.js'
import Update_contact_user from './update_contact_user.jsx';

class contact_edit_user extends Component {
    constructor(props) {
        super(props)

        this.state = {
            userAbout: [],
            user_email: ''
        }
    }

    componentDidMount() {
        userService.getUser().then((res) => {
            this.setState({ userAbout: res.data });
        });
    }

    render() {
        return (
            <div>
                <Subject />
                <main className="" id="main-collapse">
                    <div className="row">
                        <div className="col-xs-12">
                            <div className="section-container-spacer">
                                <h1>Contact</h1>
                                {
                                    this.state.userAbout.map(
                                        board =>
                                            <p>{board.contact}</p>
                                    )
                                }
                            </div>
                            <div className="section-container-spacer">
                                <form action="" className="reveal-content">
                                    <div className="row">
                                        <div className="col-md-6">
                                            <div className="form-group">
                                                <input type="email" className="form-control" id="email" placeholder="Email" readOnly />
                                            </div>
                                            <div className="form-group">
                                                <input type="text" className="form-control" id="subject" placeholder="Subject" readOnly />
                                            </div>
                                            <div className="form-group">
                                                <textarea className="form-control" rows="3" placeholder="Enter your message" readOnly />
                                            </div>
                                        </div>
                                        <div className="col-md-6">
                                            <Update_contact_user />
                                            </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>


                </main>
            </div>
        )
    }
}

export default contact_edit_user;
