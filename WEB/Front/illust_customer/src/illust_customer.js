import logo from './logo.svg';
import {useEffect, useState} from 'react';
import { BrowserRouter, Route, Link, Routes, useNavigate } from 'react-router-dom';
import ReactDOM from 'react-dom';

// import './Theme1.css';
// import './Theme2.css'
import './Theme3.css';

function useIllust_customer() {
  // const numbers = ['img-12.jpg', 'img-11.jpg', 'img-10.jpg', 'img-09.jpg', 'img-08.jpg', 'img-07.jpg', 'img-06.jpg', 'img-05.jpg'];

  const numbers = getQueryVariable("piece").split(',');


  // Front Parameter 받기
  const piece = getQueryVariable("piece");
  function getQueryVariable(variable){
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
          var pair = vars[i].split("=");
          if(pair[0] == variable){
            return pair[1];
          }
        }
         return(false);
  }

  // Back으로 보내기
    const config = {
      headers : {
        'Accept' : 'application/json'
      }
    }
    fetch(`http://localhost:8086/piece?piece=${piece}`, config)
    // .then((res) => res.text())
    // .then((data) => {
    //   console.log(data);
    // })


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
                            <li><a href="http://localhost:8005/index.html" title="">Home</a></li>
                            <li><a href="http://localhost:8001/about.html" title="">About</a></li>
                            <li><a href="http://localhost:8006/project.html" title="">Project</a></li>
                            <li><a href="http://localhost:8003/contact.html" title="">Contact</a></li>
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
      <main class="" id="main-collapse">


        <div class="hero-full-wrapper">
          <div class="grid">
            <div class="gutter-sizer"></div>
            <div class="grid-sizer"></div>

            <div>
              {numbers.map((photo, index) => (
                <div class="grid-item">
                  <img id={photo} class="img-responsive" alt="" src={photo} />
                  <a href="./project.html" class="project-description">
                    <div class="project-text-holder">
                      <div class="project-text-inner">
                        <h3>I want</h3>
                        <p>Discover more</p>
                      </div>
                    </div>
                  </a>
                </div>
              ))}
            </div>

            <div class="grid-item">
              <img class="img-responsive" alt="" src="img-12.jpg" />
              <a href="./project.html" class="project-description">
                <div class="project-text-holder">
                  <div class="project-text-inner">
                    <h3>Vivamus vestibulum</h3>
                    <p>Discover more</p>
                  </div>
                </div>
              </a>
            </div>

          </div>
        </div>


      </main>
    </div>
)
    ;
}

export default useIllust_customer;