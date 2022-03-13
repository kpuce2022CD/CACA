import logo from './logo.svg';
// import './Theme1.css';
import default_image from './Clonet_logo.jpeg';
import {useEffect, useState} from 'react';
import './Theme2.css'
// import './Theme3.css';
// import './Theme4.css';

function Root() {
    const [text, setText] = useState("");
    const onChange = (e) => {
        setText(e.target.value);
    };

    const onReset = () => {
        setText("");
    };
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
                            <li><a href="./index.html" title="">Home</a></li>
                            <li><a href="./about.html" title="">About</a></li>
                            <li><a href="./services.html" title="">Services</a></li>
                            <li><a href="./contact.html" title="">Contact</a></li>
                            <li><a href="./components.html" title="">Components</a></li>

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
                    <h1>About me</h1>

                    <p>Duis aute irure dolor in reprehenderit in voluptate velit esse
                        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                    <h3>Incididunt ut labore </h3>

                    <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
                        Phasellus
                        iaculis magna sagittis elit sagittis, at hendrerit lorem venenatis. Morbi accumsan iaculis
                        blandit.
                        Cras ultrices hendrerit nisl.</p>

                    <h3>Ut enim ad minim veniam </h3>

                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas luctus at sem quis varius.
                        Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
                        Phasellus iaculis magna sagittis elit sagittis, at hendrerit lorem venenatis. Morbi accumsan
                        iaculis
                        blandit. Cras ultrices hendrerit nisl.</p>
                    <h3>Phasellus iaculis magna </h3>
                    <p>Duis aute irure dolor in reprehenderit in voluptate velit esse
                        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                    <a href="contact.html" className="btn btn-primary" title=""> Get in touch</a>
                </div>
            </div>
        </main>
</div>
)
    ;
}

export default Root;