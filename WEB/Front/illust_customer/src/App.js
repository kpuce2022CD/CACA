
import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';

import Illust_cst from './illust_customer.js'


function App() {
  // const [message, setMessage] = useState("1")
  // const [message2, setMessage2] = useState("2")

  // useEffect(()=>{
  //   fetch("/illust_customer1")
  //       .then(res => res.text())
  //       .then(m=>setMessage(m))
  // }, [])

  // useEffect(()=>{
  //   fetch("/illust_customer2")
  //       .then(res => res.text())
  //       .then(m=>setMessage2(m))
  // }, [])

  return (
    <div>
      <Illust_cst />
    </div>

  );
}

export default App;