// import logo from './logo.svg';
import './App.css';
import { useEffect, useState, useRef } from 'react';
import Home from './home.js'
import { BrowserRouter, Route, Link, Routes, useNavigate } from 'react-router-dom';
import ReactDOM from 'react-dom';
import Subject from './Subject.jsx';

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
            navigate("../",  { replace: true});
          } else{
            alert('로그인에 실패했습니다. 다시 시도해주세요.');
          }

        });
  }

  return (
      <div>
        <Subject />
        <main className="" id="main-collapse">
          <div className="row">
            <center>
              <div aria-setsize={2}>
                <div className="form-group">
                  <input className="form-control" id="id" onChange={onChangeId} value={user_id} placeholder="ID"/>
                </div>
                <div className="form-group">
                  <input className="form-control" id="passwd" onChange={onChangePw} value={user_pw} placeholder="Password"/>
                </div>
                <button type="submit" id="login_submit" className="btn btn-primary btn-lg" onClick={handleClick}>Login</button>
              </div>
            </center>

          </div>


        </main>
      </div>
  );
}

export default useLogin;