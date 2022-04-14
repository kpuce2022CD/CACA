import logo from './logo.svg';
import {useEffect, useState} from 'react';

import './Theme1.css';
// import './Theme2.css'
// import './Theme3.css';
// import './Theme4.css';

function home() {
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
                            <li><a href="http://localhost:8005/home" title="">Home</a></li>
                            <li><a href="http://localhost:8005/about" title="">About</a></li>
                            <li><a href="http://localhost:8007/" title="">Project</a></li>
                            <li><a href="http://localhost:8005/contact" title="">Contact</a></li>
                            <li><a href="http://localhost:8005/login" title="">Login</a></li>
                            {/* <li><a href="./components.html" title="">Components</a></li> */}
    
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
                    <div>
                        <center>
                            <header>
                                <img src="http://13.209.116.111/images/Clonet_logo.jpeg" className="App-logo" alt="logo" />
                                <p className="clonet-head">CLONET</p>
                            </header>
                        </center>
    
                    </div>
                </div>
    
    
            </main>
        </div>
)
    ;
}

export default home;