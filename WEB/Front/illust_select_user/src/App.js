import logo from './logo.svg';
import './App.css';
import React, { useEffect, useState } from 'react';

function App() {
  const [style, setStyle] = useState("unclicked");
  const [image, setImage] = useState([]);
  const numbers = ['img-12.jpg', 'img-11.jpg', 'img-10.jpg'];
  const clicked_photo = [];

  function inputClickEvent(element_id) { // 클릭 이벤트 삽입
    var input = document.getElementById(element_id)
		input.addEventListener('click', function(e) { // input 에 이벤트 리스너 삽입.
			if (input.classList.contains("clicked")) { // clicked는 css 스타일 추가 (외곽선) 해주는 연산.
				input.classList.remove("clicked");
        var index = clicked_photo.indexOf(element_id)
        if (index !== -1) {
          clicked_photo.splice(index, 1);
        }
        console.log(clicked_photo); // result

			} else {
				input.classList.add("clicked");
        clicked_photo.push(element_id);
        console.log(clicked_photo); // result
			}
		})
	}


  // const [message, setMessage] = useState("1")
  // const [message2, setMessage2] = useState("2")

  // useEffect(()=>{
  //   fetch("/illust_select_user1")
  //       .then(res => res.text())
  //       .then(m=>setMessage(m))
  // }, [])

  // useEffect(()=>{
  //   fetch("/illust_select_user2")
  //       .then(res => res.text())
  //       .then(m=>setMessage2(m))
  // }, [])

  return (
    <div>
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
            <li><a href="http://localhost:8002/about.html" title="">About</a></li>
            <li><a href="http://localhost:8007/service.html" title="">Project</a></li>
            <li><a href="http://localhost:8004/contact.html" title="">Contact</a></li>
            {/* <li><a href="./components.html" title="">Components</a></li> */}

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
      {/* <main class="" id="main-collapse"> */}


      <div>
      {numbers.map((photo, index) => (
        <img id={photo} class="img-responsive" alt="" src={photo} onClick={() => inputClickEvent(photo)}/>
      ))}
    </div>
    </div>
    
  );

}

export default App;