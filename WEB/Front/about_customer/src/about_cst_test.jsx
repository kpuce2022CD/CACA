import React, { Component } from 'react';
import aboutService from './aboutService.js';
import './Theme1.css';

class about_cst_test extends Component {
    constructor(props) {
        super(props)

        this.state = { 
            userAbout: []
        }
		
    }

    componentDidMount() {
        aboutService.getUser().then((res) => {
            this.setState({ userAbout: res.data});
        });
    }


    render() {
        return (
        <div>
            <header className="">
                <div className="navbar navbar-default visible-xs">
                    <button type="button" className="navbar-toggle collapsed">
                        <span className="sr-only">Toggle navigation</span>
                        <span className="icon-bar"></span>
                        <span className="icon-bar"></span>
                        <span className="icon-bar"></span>
                    </button>
                    <a href="./index.html" className="navbar-brand">Mashup Template</a>
                </div>

                <nav className="sidebar">
                    <div className="navbar-collapse" id="navbar-collapse">
                        <div className="site-header hidden-xs">
                            <a className="site-brand" href="./index.html" title="">
                                <img className="img-responsive site-logo" alt="" src="./assets/images/mashup-logo.svg"/>
                                Mashup Template
                            </a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                tempor.</p>
                        </div>
                        <ul className="nav">
                            <li><a href="/home_customer" title="">Home</a></li>
                            <li><a href="/about_customer" title="">About</a></li>
                            <li><a href="project.html" title="">Project</a></li>
                            <li><a href="/contct_customer" title="">Contact</a></li>
                            {/*<li><a href="http://localhost:8003/contact.html" title="">Contact</a></li>*/}
                            {/* <li><a href="./components.html" title="">Components</a></li> */}

                            {/*<li><Link to="/contct_customer">Contact</Link></li>*/}


                        </ul>

                        <nav className="nav-footer">
                            <p className="nav-footer-social-buttons">
                                <a className="fa-icon" href="https://www.instagram.com/" title="">
                                    <i className="fa fa-instagram"></i>
                                </a>
                                <a className="fa-icon" href="https://dribbble.com/" title="">
                                    <i className="fa fa-dribbble"></i>
                                </a>
                                <a className="fa-icon" href="https://twitter.com/" title="">
                                    <i className="fa fa-twitter"></i>
                                </a>
                            </p>
                            <p>© Untitled | Website created with <a href="http://www.mashup-template.com/"
                                                                    title="Create website with free html template">Mashup
                                Template</a>/<a href="https://www.unsplash.com/"
                                                title="Beautiful Free Images">Unsplash</a>
                            </p>
                        </nav>
                    </div>
                </nav>
            </header>

            <main className="" id="main-collapse">
            <div className="row">
                <div className="col-xs-12 col-md-6">
                    <img className="img-responsive" alt="" src="./assets/images/img-10.jpg"/>
                </div>
                <div className="col-xs-12 col-md-6">
                    {/* <h1>About me</h1> */}
                    <div>
                    <table>
                        <thread>
                            <tr>
                                <th><h1>About me</h1></th>
                            </tr>
                        </thread>
                    <tbody>
                        {   
                            this.state.userAbout.map(
                                board =>
                                <tr key = {board.user_id}>
                                    <td><p>{board.user_id}</p></td>
                                    <td><p>{board.about}</p></td>
                                </tr>
                            )
                        }
                    </tbody>
                    </table>
                    </div>
                    <a href="/contact_customer" className="btn btn-primary" title=""> Get in touch</a>
                </div>
            </div>
        </main>
</div>
);
        }
};

export default about_cst_test;
