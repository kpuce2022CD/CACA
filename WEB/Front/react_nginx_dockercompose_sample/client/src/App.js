// import React, { useState, useEffect } from 'react';
// import axios from 'axios'
// import './App.css';

// function App() {
//   // 요청받은 정보를 담아줄 변수 선언
//   const [ testStr, setTestStr ] = useState('ho');

//   // 변수 초기화
//   function callback(str) {
//     setTestStr(str);
//   }

//   // 첫 번째 렌더링을 마친 후 실행
//   useEffect(
//       () => {
//         // axios({
//         //     url: '/home',
//         //     method: 'GET'
//         // }).then((res) => {
//         //     callback(res.data);
//         // })
//         axios.get('/api/test')
//         .then((Resource) => {callback(Response.data)})
//         .catch((Error)=>{console.log(Error)})
//       }, []
//   );

//   return (
//       <div className="App">
//           <header className="App-header">
//               {testStr}
//           </header>
//       </div>
//   );
// }

// export default App;


import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';

function App() {

  const [message, setMessage] = useState("")

useEffect(()=>{
fetch("/home")
.then(res => res.text())
.then(m=>setMessage(m))
}, [])

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          {message}
          {/* Edit <code>src/App.js</code> and save to reload. */}
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
