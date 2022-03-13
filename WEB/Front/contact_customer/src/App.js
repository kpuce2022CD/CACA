

import logo from './logo.svg';
// import './App.css';
import { useEffect, useState } from 'react';
import Contact_cst from './contact_customer.js';

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
    <div>
      <Contact_cst />
    </div>
      
  );
}

export default App;
