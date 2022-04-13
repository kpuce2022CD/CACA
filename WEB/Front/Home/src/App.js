

import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';
import Home from './home.js'
import About_edit_user from './about_edit_user.js'
import Contact_edit_user from './contact_edit_user.js'
import Login from './login.js'
import { BrowserRouter, Route, Link, Routes } from 'react-router-dom';

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
    <BrowserRouter>
        <div>
            {/*<Routes>*/}
            {/*    <Route exact path="/">*/}
            {/*        <Home />*/}
            {/*    </Route>*/}
            {/*    <Route exact path="/home" component={Home}>*/}
            {/*        <Home />*/}
            {/*    </Route>*/}
            {/*    <Route exact path="/about" component={About_edit_user}>*/}
            {/*        <About_edit_user />*/}
            {/*    </Route>*/}
            {/*    <Route path="/contact" component={Contact_edit_user}>*/}
            {/*        <Contact_edit_user/>*/}
            {/*    </Route>*/}
            {/*    <Route path="/login" component={Login}>*/}
            {/*        <Login/>*/}
            {/*    </Route>*/}
            {/*</Routes>*/}
            <Routes>

                <Route path="/" element={<Home />} />
                <Route path="/home" element={<Home />} />
                <Route path="/about" element={<About_edit_user />} />
                <Route path="/contact" element={<Contact_edit_user />} />
                <Route path="/login" element={<Login />} />
            </Routes>

        </div>

    </BrowserRouter>
  );
}

export default App;
