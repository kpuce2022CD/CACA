import React, { Component } from 'react';
import aboutService from './aboutService.js';
import './Theme1.css';
import Subject from './Subject.jsx';

class about_cst_test extends Component {
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
        // console.log("this is userAbout" + this.state.userAbout.map(
        //     i =>
        //     {i.profilePic}
        // ));
    }

    render() {
        return (
            <div>
                <Subject />
                <main className="" id="main-collapse">
                    <div className="row">
                        <div className="col-xs-12 col-md-6">
                            {
                                this.state.userAbout.map(
                                    board =>
                                    <img className="img-responsive" alt="./assets/images/img-10.jpg" src={board.profilePic } width="300" height="300" />
                                )
                            }
                            {/* <img className="img-responsive" alt="" src="./assets/images/img-10.jpg" /> */}
                        </div>
                        <div className="col-xs-12 col-md-6">
                            <h1>About me</h1>
                            {
                                this.state.userAbout.map(
                                    board =>
                                        <p>{board.about}</p>
                                )
                            }
                            <a href="/contact_customer" className="btn btn-primary" title=""> Get in touch</a>
                        </div>
                    </div>
                </main>
            </div>
        );
    }
};

export default about_cst_test;
