import logo from './logo.svg';
import add_image from './add_image.png';
import './App.css';
import React, { useEffect, useState, Component } from 'react';
import Subject from './Subject.jsx';
import userService from './userService.js'

class about_edit_user extends Component {
    constructor(props) {
        super(props)

        this.state = {
            userAbout: [],
            about: '',
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
                    this.setState({ user_login : data+ " 님"})
                    console.log('login_user => '+ this.state.user_login);
                } else {
                    console.log('로그인 안됨', data);
                }
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
                <Subject name={this.state.user_login} />
                <main className="" id="main-collapse">
                    <div className="row">
                        <div className="form-group">
                            <label>Profile Picture</label>
                            {
                                this.state.userAbout.map(
                                    board =>
                                        <div>
                                            <img className="img-responsive" alt={add_image} src={board.profilePic} width="300" height="300" />
                                        </div>
                                )
                            }
                        </div>
                        <div className="col-xs-12 col-md-6">
                            <div className="form-group">
                                <label>Existing</label>
                                {
                                    this.state.userAbout.map(
                                        board =>
                                            <textarea className="form-control" rows="5" placeholder={board.about} readOnly ></textarea>
                                    )
                                }
                            </div>
                            <div>
                                <div className="form-group">
                                    <label>Edit</label>

                                    <textarea className="form-control" rows="25" 
                                        defaultValue={this.state.userAbout.map(i => i.about)}
                                        value={this.about} onChange={this.changeAboutHandler}></textarea>
                                </div>
                                <button type="submit" className="btn btn-primary btn-lg" onClick={this.updateAbout}>Save</button>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        )
    }
}

export default about_edit_user;