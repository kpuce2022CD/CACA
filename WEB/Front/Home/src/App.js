

import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';

function App() {

  const [message, setMessage] = useState("1")
  const [message2, setMessage2] = useState("2")

  useEffect(()=>{
    fetch("/home1")
        .then(res => res.text())
        .then(m=>setMessage(m))
  }, [])

  useEffect(()=>{
    fetch("/home2")
        .then(res => res.text())
        .then(m=>setMessage2(m))
  }, [])

  return (
      <div className="App">
        <header className="App-header">
          <p>Clonet</p>
          <img src={logo} className="App-logo" alt="logo" />
        </header>
      </div>
  );
}

export default App;
