

// import logo from './logo.svg';
import './App.css';
import { useEffect, useState, useRef } from 'react';
import Home from './home.js'
import { BrowserRouter, Route, Link, Routes, useNavigate } from 'react-router-dom';
import ReactDOM from 'react-dom';
function useLogin() {

  const [user_id, setMessage_id] = useState("");
  const [user_pw, setMessage_pw] = useState("");


  const onChangeId = (e) => {
    setMessage_id(e.target.value);
  };
  const onChangePw = (e) => {
    setMessage_pw(e.target.value);
  };

  const navigate = useNavigate();
  const handleClick = (e) => {

    e.preventDefault()
    // form tag 때문에 preventDefault()로 막아줘야함.
    fetch("http://localhost:8085/login?user_id="+user_id+"&user_pw="+user_pw, {
      method: "POST",
      headers: new Headers({
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }),
    })
        .then((response) => response.json())
        .then((result) => {

          console.log("백엔드에서 오는 응답 메세지 ", result);
          if(result.toString() == "true"){
            // ReactDOM.render(
            //     <BrowserRouter>
            //       <Home />
            //     </BrowserRouter>,
            //     document.getElementById('#root')
            // );
            navigate("../",  { replace: true});
          } else{
            alert('로그인에 실패했습니다. 다시 시도해주세요.');
          }

        });
  }


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
            <center>
              <div aria-setsize={2}>
                <div className="form-group">
                  <input className="form-control" onChange={onChangeId} value={user_id} placeholder="ID"/>
                </div>
                <div className="form-group">
                  <input className="form-control" onChange={onChangePw} value={user_pw} placeholder="Password"/>
                </div>
                <button type="submit" className="btn btn-primary btn-lg" onClick={handleClick}>Login</button>
              </div>
            </center>

          </div>


        </main>
      </div>
  );
}

export default useLogin;