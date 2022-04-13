

import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';

function contact_edit_user() {
  //
  // const [message, setMessage] = useState("1")
  // const [message2, setMessage2] = useState("2")
  //
  // useEffect(()=>{
  //   fetch("/contact_edit_user1")
  //       .then(res => res.text())
  //       .then(m=>setMessage(m))
  // }, [])
  //
  // useEffect(()=>{
  //   fetch("/contact_edit_user2")
  //       .then(res => res.text())
  //       .then(m=>setMessage2(m))
  // }, [])

  return (
      // <div className="App">
      //   <header className="App-header">
      //     <form>
      //       <p>Edit User Contact Page</p>
      //       <p><input type="text" name="user_name" value="User_Name"></p>
      //       <p><input type="text" name="user_email" value="User_Email"></p>
      //       <p><input type="text" name="email_context" value="Email_Context"></p>
      //       <p><input type="submit" value="Save"></p>
      //     </form>
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
                <li><a href="http://localhost:8005/home" title="">Home</a></li>
                <li><a href="http://localhost:8005/about" title="">About</a></li>
                <li><a href="http://localhost:8007/" title="">Project</a></li>
                <li><a href="http://localhost:8005/contact" title="">Contact</a></li>
                <li><a href="http://localhost:8005/login" title="">login</a></li>
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
            <div className="col-xs-12">
              <div className="section-container-spacer">
                <h1>Contact</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                  tempor incididunt ut labore et dolore magna aliqua. <br></br>sUt enim ad minim veniam,
                  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                  consequat.</p>
              </div>
              <div className="section-container-spacer">
                <form action="" className="reveal-content">
                  <div className="row">
                    <div className="col-md-6">
                      <div className="form-group">
                        <input type="email" className="form-control" id="email" placeholder="Email" readOnly/>
                      </div>
                      <div className="form-group">
                        <input type="text" className="form-control" id="subject" placeholder="Subject" readOnly/>
                      </div>
                      <div className="form-group">
                        <textarea className="form-control" rows="3" placeholder="Enter your message" readOnly/>
                      </div>
                    </div>
                    <div className="col-md-6">
                      <div className="form-group">
                        <input type="text" className="form-control" id="user_email" placeholder="Your Email"/>
                      </div>
                      <button type="submit" className="btn btn-primary btn-lg">Save</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>


        </main>
      </div>
  );
}

export default contact_edit_user;
