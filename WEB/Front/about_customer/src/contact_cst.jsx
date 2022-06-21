import React, { Component } from 'react';
import aboutService from './aboutService.js';
import './Theme1.css';
import Email from './emailJS.jsx';
import Subject from './Subject.jsx';

class contact_cst extends Component {
    constructor(props) {
        super(props)
        this.state = {
            userAbout: []
        }
    }

    componentDidMount() {
        aboutService.getUser().then((res) => {
            this.setState({ userAbout: res.data });
        });
    }

    render() {
        return (
            <div>
                <Subject />
                <main className="" id="main-collapse">
                    <div className="row">
                        <div class="col-xs-12">
                            <div class="section-container-spacer">
                                <div>
                                    <h1>Contact</h1>
                                </div>
                            </div>
                            <div class="section-container-spacer">
                                <div class="row">
                                    {
                                        this.state.userAbout.map(
                                            board =>
                                                <Email user_email={board.contact} user_name={board.user_name} />
                                        )
                                    }
                                    <div class="col-md-6">
                                        <ul class="list-unstyled address-container">
                                            <li>
                                                <span class="fa-icon">
                                                    <i class="fa fa-at" aria-hidden="true"></i>
                                                </span>
                                                {
                                                    this.state.userAbout.map(
                                                        board =>
                                                            board.contact
                                                    )
                                                }
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        );
    }
};

export default contact_cst;