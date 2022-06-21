import logo from './logo.svg';
import './App.css';
import React, { useEffect, useState, Component } from 'react';
import Subject from './Subject.jsx';
import userService from './userService.js'

class contact_edit_user extends Component {
    constructor(props) {
        super(props)

        this.state = {
            userAbout: [],
            contact: '',
            user_login: 'Login'
        }
    }

    componentDidMount() {
        userService.getUser().then((res) => {
            this.setState({ userAbout: res.data });
        });

        fetch("http://localhost:8085/auth", {
            method: "POST",
            headers: new Headers({
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }),
        })
            .then(res => {
                if (!res.ok) {
                    throw Error("could not fetch the data that resource");
                }
                return res.text();
            })
            .then(data => {
                if (data != null) {
                    console.log('로그인 성공', data);
                    this.setState({ user_login: data + " 님" })
                    console.log('login_user => ' + this.state.user_login);
                } else {
                    console.log('로그인 안됨', data);
                }
            });
    }

    updateContact = (e) => {
        e.preventDefault();

        console.log('contact => ' + this.state.contact);
        fetch("http://localhost:8085/contact?contact=" + this.state.contact, {
            method: "POST",
            headers: new Headers({
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }),
        })
    }

    changeContactHandler = (event) => {
        this.setState({ contact: event.target.value });
    }

    render() {
        return (
            <div>
                <Subject name={this.state.user_login} />
                <main className="" id="main-collapse">
                    <div className="row">
                        <div className="col-xs-12">
                            <div className="section-container-spacer">
                                <h1>Contact</h1>
                                {/* {
                                    this.state.userAbout.map(
                                        board =>
                                            <p>{board.contact}</p>
                                    )
                                } */}
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
                                            <div className="form-group" >
                                                <textarea id="contact_edit" name="contact_edit" className="form-control" rows="1" 
                                                    defaultValue={this.state.userAbout.map(i => i.contact)}
                                                    value={this.contact} onChange={this.changeContactHandler}></textarea>
                                            </div>
                                            <button id="contact_submit" name="contact_submit" type="submit" className="btn btn-primary btn-lg" onClick={this.updateContact}>Save</button>
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
