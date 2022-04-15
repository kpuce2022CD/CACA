import logo from './logo.svg';
import './App.css';
import React, { useEffect, useState } from 'react';

function App() {
  const [style, setStyle] = useState("unclicked");
  const [image, setImage] = useState([]);
  const numbers = [];
  const clicked_photo = [];

  // 로그인 정보 받아와서 로그인 확인하기
  const [user_login, setMessageLogin] = useState("Login");
  fetch("http://localhost:8085/auth", {
    method: "POST",
    headers: new Headers({
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }),
  })
      .then(res => {
        if (!res.ok) {
          throw Error("could not fetch the data that resource");
        }
        return res.text();
      })
      .then(data => {

        if(data != null){
          console.log('로그인 성공_select_user', data);
          setMessageLogin(data+"  님");

          // DB에서 아이디로 Repository 정보 받아오기 http://localhost:8087/piece_u?user_id=user1
          fetch("http://localhost:8087/piece_u?user_id="+data, {
            method: "POST",
            headers: new Headers({
              'Accept': 'application/json',
              'Content-Type': 'application/json'
            }),
          })
              .then(res => {
                if (!res.ok) {
                  throw Error("could not fetch the data that resource");
                }
                return res.text();
              })
              .then(data => {
                console.log('userRepo:', data);

                // 이미지 불러오기
                numbers = data.toString().split(',');
                console.log(numbers);

                numbers.map((photo, index) => (
                    console.log("http://13.209.116.111/clonet-repo/" + photo)
                ))

                // const piece = getQueryVariable("piece_u");

                // Back으로 보내기
                // const config = {
                //   headers : {
                //     'Accept' : 'application/json'
                //   }
                // }
                // fetch(`http://localhost:8087/piece_u?piece=${piece}`, config)
              });
        } else{
          console.log('로그인 안됨', data);
        }
      })


  // Front Parameter 받기

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




  // 이미지 선택
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
              <li><a href="http://localhost:8005/home" title="">Home</a></li>
              <li><a href="http://localhost:8005/about" title="">About</a></li>
              <li><a href="http://localhost:8007/" title="">Project</a></li>
              <li><a href="http://localhost:8005/contact" title="">Contact</a></li>
              <li><a href="http://localhost:8005/login" title="">{user_login}</a></li>
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
          <img id={photo} className="img-responsive" alt="" src={"http://13.209.116.111/clonet-repo/" + photo} onClick={() => inputClickEvent(photo)}/>
        // <img id={photo} class="img-responsive" alt="" src={photo} onClick={() => inputClickEvent(photo)}/>
      ))}
    </div>
    </div>
    
  );

}

export default App;