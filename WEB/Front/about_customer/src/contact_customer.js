import logo from './logo.svg';
import {useEffect, useState} from 'react';
import { Route, Link } from 'react-router-dom';
import './Theme1.css';
// import './Theme2.css'
// import './Theme3.css';
// import './Theme4.css';

function contact_customer() {
    // const [text, setText] = useState("");
    // const onChange = (e) => {
    //     setText(e.target.value);
    // };

    // const onReset = () => {
    //     setText("");
    // };
    return (
        // <div className="App">
      //   <header className="App-header">
      //     <p>user_name</p>
      //     <p>user_email</p>
      //     <p>email_context</p>
      //     <form>
      //       <p><input type="text" name="contact_context" value="contact_context"></p>
      //       <p><input type="submit" value="Submit"></p>
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
            <li><a href="http://localhost:8001/about_customer" title="">About</a></li>
            <li><a href="http://localhost:8006/project.html" title="">Project</a></li>
            <li><a href="http://localhost:8001/contct_customer" title="">Contact</a></li>
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
      <div class="row">
        <div class="col-xs-12">
          <div class="section-container-spacer">
            <h1>Contact</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
              tempor incididunt ut labore et dolore magna aliqua. <br></br>sUt enim ad minim veniam,
                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                consequat.</p>
          </div>
          <div class="section-container-spacer">
            <form action="" class="reveal-content">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input type="email" class="form-control" id="email" placeholder="Email"/>
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control" id="subject" placeholder="Subject"/>
                  </div>
                  <div class="form-group">
                    <textarea class="form-control" rows="3" placeholder="Enter your message"/>
                  </div>
                  <button type="submit" class="btn btn-primary btn-lg">Send</button>
                </div>
                <div class="col-md-6">
                  <ul class="list-unstyled address-container">
                    <li>
                <span class="fa-icon">
                  <i class="fa fa-at" aria-hidden="true"></i>
                </span>
                      e-mail@mail.io
                    </li>
                  </ul>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>


    </main>
</div>
)
    ;
}

export default contact_customer;