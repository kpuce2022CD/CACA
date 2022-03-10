

import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';

function App() {

  const [message, setMessage] = useState("1")
  const [message2, setMessage2] = useState("2")

  useEffect(()=>{
    fetch("/contact_customer1")
        .then(res => res.text())
        .then(m=>setMessage(m))
  }, [])

  useEffect(()=>{
    fetch("/contact_customer2")
        .then(res => res.text())
        .then(m=>setMessage2(m))
  }, [])

  return (
      <div className="App">
        <header className="App-header">
          <p>user_name</p>
          <p>user_email</p>
          <p>email_context</p>
          <form>
            <p><input type="text" name="contact_context" value="contact_context"></p>
            <p><input type="submit" value="Submit"></p>
          </form>
        </header>
      </div>
  );
}

export default App;
