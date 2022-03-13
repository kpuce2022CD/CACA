

import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';
import Home from './home.js'

function App() {

//   const [message, setMessage] = useState("1")
//   const [message2, setMessage2] = useState("2")

//   useEffect(()=>{
//     fetch("/home1")
//         .then(res => res.text())
//         .then(m=>setMessage(m))
//   }, [])

//   useEffect(()=>{
//     fetch("/home2")
//         .then(res => res.text())
//         .then(m=>setMessage2(m))
//   }, [])

  return (
      <div>
          <Home />
      </div>
  );
}

export default App;
