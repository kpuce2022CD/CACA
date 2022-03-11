

import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';

function App() {

  const [message, setMessage] = useState("1")
  const [message2, setMessage2] = useState("2")

  useEffect(()=>{
    fetch("/illust_customer1")
        .then(res => res.text())
        .then(m=>setMessage(m))
  }, [])

  useEffect(()=>{
    fetch("/illust_customer2")
        .then(res => res.text())
        .then(m=>setMessage2(m))
  }, [])

  return (
      // <div className="App">
      //   <header className="App-header">
      //     <img src={logo} className="App-logo" alt="logo" />
      //     <p>
      //       {message}
      //     </p>
      //     <p>
      //       {message2}
      //     </p>
      //     <a
      //         className="App-link"
      //         href="https://reactjs.org"
      //         target="_blank"
      //         rel="noopener noreferrer"
      //     >
      //       Learn React
      //     </a>
      //   </header>
      // </div>
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
                  Template</a>/<a href="https://www.unsplash.com/" title="Beautiful Free Images">Unsplash</a></p>
              </nav>
            </div>
          </nav>
        </header>

        <main className="" id="main-collapse">
          <div className="row">
            <div className="col-xs-12 section-container-spacer">
              <h1>Services</h1>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua. <br></br>Ut enim ad minim veniam,
                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                consequat.</p>
            </div>

            <div className="col-xs-12 col-md-4 section-container-spacer">
              <img className="img-responsive" alt="" src="./assets/images/img-12.jpg"/>
              <h2>Consectetur</h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur
                adipiscing elit.</p>
              <a href="./contact.html" className="btn btn-primary" title=""> Get in touch</a>
            </div>

            <div className="col-xs-12 col-md-4 section-container-spacer">
              <img className="img-responsive" alt="" src="./assets/images/img-13.jpg"/>
              <h2>Adipiscing</h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur
                adipiscing elit.</p>
              <a href="./contact.html" className="btn btn-primary" title=""> Get in touch</a>
            </div>

            <div className="col-xs-12 col-md-4 section-container-spacer">
              <img className="img-responsive" alt="" src="./assets/images/img-14.jpg"/>
              <h2>Dolor</h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur
                adipiscing elit.</p>
              <a href="./contact.html" className="btn btn-primary" title=""> Get in touch</a>
            </div>

          </div>


        </main>
      </div>
  );
}

export default App;