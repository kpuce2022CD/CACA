

import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';

function App() {

  const [message, setMessage] = useState("a")
  const [message2, setMessage2] = useState("b")

  useEffect(()=>{
    fetch("/asdf")
        .then(res => res.text())
        .then(m=>setMessage(m))
  }, [])

  useEffect(()=>{
    fetch("/about_customer")
        .then(res => res.text())
        .then(m=>setMessage2(m))
  }, [])

  return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <p>
            {message}
            {/* Edit <code>src/App.js</code> and save to reload. */}
          </p>
          <p>
            {message2}
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