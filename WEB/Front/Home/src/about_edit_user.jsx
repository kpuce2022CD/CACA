import logo from './logo.svg';
import add_image from './add_image.png';
import './App.css';
import React, { useEffect, useState, Component } from 'react';
import Subject from './Subject.jsx';
import userService from './userService.js'
import Update_about_user from './update_about_user.jsx';

class about_edit_user extends Component {
    constructor(props) {
        super(props)

        this.state = {
            userAbout: []
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
                                <Update_about_user />
                        </div>
                    </div>
                </main>
            </div>
        )
    }
}

export default about_edit_user;