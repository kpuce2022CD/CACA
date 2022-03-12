
import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';


function App() {
  const numbers = ['img-12.jpg', 'img-11.jpg', 'img-10.jpg', 'img-09.jpg'
  , 'img-08.jpg', 'img-07.jpg', 'img-06.jpg', 'img-05.jpg'];

  // const [message, setMessage] = useState("1")
  // const [message2, setMessage2] = useState("2")

  // useEffect(()=>{
  //   fetch("/illust_customer1")
  //       .then(res => res.text())
  //       .then(m=>setMessage(m))
  // }, [])

  // useEffect(()=>{
  //   fetch("/illust_customer2")
  //       .then(res => res.text())
  //       .then(m=>setMessage2(m))
  // }, [])

  return (
    <div>
//      <h2>aaaaaa</h2>
      <header class="">
        <div class="navbar navbar-default visible-xs">
          <button type="button" class="navbar-toggle collapsed">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a href="./index.html" class="navbar-brand">Mashup Template</a>
        </div>

        <nav class="sidebar">
          <div class="navbar-collapse" id="navbar-collapse">
            <div class="site-header hidden-xs">
              <a class="site-brand" href="./index.html" title="">
                <img class="img-responsive site-logo" alt="" src="./assets/images/mashup-logo.svg" />
                Mashup Template
              </a>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                tempor.</p>
            </div>
            <ul class="nav">
              <li><a href="./index.html" title="">Home</a></li>
              <li><a href="./about.html" title="">About</a></li>
              <li><a href="./services.html" title="">Services</a></li>
              <li><a href="./contact.html" title="">Contact</a></li>
              <li><a href="./components.html" title="">Components</a></li>

            </ul>

            <nav class="nav-footer">
              <p class="nav-footer-social-buttons">
                <a class="fa-icon" href="https://www.instagram.com/" title="">
                  <i class="fa fa-instagram"></i>
                </a>
                <a class="fa-icon" href="https://dribbble.com/" title="">
                  <i class="fa fa-dribbble"></i>
                </a>
                <a class="fa-icon" href="https://twitter.com/" title="">
                  <i class="fa fa-twitter"></i>
                </a>
              </p>
              <p>© Untitled | Website created with <a href="http://www.mashup-template.com/" title="Create website with free html template">Mashup Template</a>/<a href="https://www.unsplash.com/" title="Beautiful Free Images">Unsplash</a></p>
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

  );
}

export default App;