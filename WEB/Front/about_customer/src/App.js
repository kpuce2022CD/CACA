import logo from './logo.svg';
import './App.css';
// import Root from './Theme1.js';
import default_image from './Clonet_logo.jpeg';
import {useEffect, useState} from 'react';
import Contact_cst from './contact_cst.jsx';
import AboutTest from "./about_cst_test.jsx"
import Home from './home.js';
import { BrowserRouter, Route, Link, Routes } from 'react-router-dom';

// function App() {
//
//   const [message, setMessage] = useState("1")
//   const [message2, setMessage2] = useState("2")
//
//   useEffect(()=>{
//     fetch("/about_customer1")
//         .then(res => res.text())
//         .then(m=>setMessage(m))
//   }, [])
//
//   useEffect(()=>{
//     fetch("/about_customer2")
//         .then(res => res.text())
//         .then(m=>setMessage2(m))
//   }, [])
//
//   return (
//       <div className="App">
//         <header className="App-header">
//           <img src={logo} className="App-logo" alt="logo" />
//           <p>
//             {message}
//           </p>
//           <p>
//             {message2}
//           </p>
//           <a
//               className="App-link"
//               href="https://reactjs.org"
//               target="_blank"
//               rel="noopener noreferrer"
//           >
//             Learn React
//           </a>
//         </header>
//       </div>
//   );
// }

function App() {
    const [text, setText] = useState("");
        
    const onChange = (e) => {
        setText(e.target.value);
    };

    const onReset = () => {
        setText("");
    };
    return (
        <BrowserRouter>
            <div>
                {/*<Routes>*/}
                {/*    <Route exact path="/">*/}
                {/*        <Home />*/}
                {/*    </Route>*/}
                {/*    <Route exact path="/home_customer">*/}
                {/*        <Home />*/}
                {/*    </Route>*/}
                {/*    <Route path="/about_customer">*/}
                {/*        <About_customer />*/}
                {/*    </Route>*/}
                {/*    <Route path="/contct_customer" component={Contact_cst}>*/}
                {/*        <Contact_cst/>*/}
                {/*    </Route>*/}
                {/*</Routes>*/}
                <Routes>
                    <Route path="/" element={<Home />} />
                    <Route path="/home_customer" element={<Home />} />
                    <Route path="/about_customer" element={<AboutTest />} />
                    <Route path="/contact_customer" element={<Contact_cst />} />
                    {/* <Route path="/test" element={<AboutTest />} /> */}
                </Routes>

            </div>

        </BrowserRouter>

    );
}

export default App;