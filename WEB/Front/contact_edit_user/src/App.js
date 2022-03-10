

import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';

function App() {

  const [message, setMessage] = useState("1")
  const [message2, setMessage2] = useState("2")

  useEffect(()=>{
    fetch("/contact_edit_user1")
        .then(res => res.text())
        .then(m=>setMessage(m))
  }, [])

  useEffect(()=>{
    fetch("/contact_edit_user2")
        .then(res => res.text())
        .then(m=>setMessage2(m))
  }, [])

  return (
      <div className="App">
        <header className="App-header">
          <form>
            <p>Edit User Contact Page</p>
            <p><input type="text" name="user_name" value="User_Name"></p>
            <p><input type="text" name="user_email" value="User_Email"></p>
            <p><input type="text" name="email_context" value="Email_Context"></p>
            <p><input type="submit" value="Save"></p>
          </form>
        </header>
      </div>
  );
}

export default App;
