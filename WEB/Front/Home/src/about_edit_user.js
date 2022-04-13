import logo from './logo.svg';
import add_image from './add_image.png';
import './App.css';
import {useEffect, useState} from 'react';

// function App() {
//
//   const [message, setMessage] = useState("1")
//   const [message2, setMessage2] = useState("2")
//
//   useEffect(()=>{
//     fetch("/about_edit_user1")
//         .then(res => res.text())
//         .then(m=>setMessage(m))
//   }, [])
//
//   useEffect(()=>{
//     fetch("/about_edit_user2")
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


function about_edit_user() {
    // const [text, setText] = useState("");
    // const onChange = (e) => {
    //     setText(e.target.value);
    // };
    //
    // const onReset = () => {
    //     setText("");
    // };
    return (
        // <div className="App">
        //   <header className="about_edit_user">
        //       About_Edit_User
        //   </header>
        //     <img src={add_image} alt="add_image" width={200} height={200}/>
        //     <input onChange={onChange} value={text} />
        //     <div>
        //         <button>Save</button>
        //         <button>Cancel</button>
        //     </div>
        //
        //
        // </div>
        <div>
            <header className="">
                <div className="navbar navbar-default visible-xs">
                    <button type="button" className="navbar-toggle collapsed">
                        <span className="sr-only">Toggle navigation</span>
                        <span className="icon-bar"></span>
                        <span className="icon-bar"></span>
                        <span className="icon-bar"></span>
                    </button>
                    <a href="./index.html" className="navbar-brand">Mashup Template</a>
                </div>

                <nav className="sidebar">
                    <div className="navbar-collapse" id="navbar-collapse">
                        <div className="site-header hidden-xs">
                            <a className="site-brand" href="./index.html" title="">
                                <img className="img-responsive site-logo" alt="" src="./assets/images/mashup-logo.svg"/>
                                Mashup Template
                            </a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                tempor.</p>
                        </div>
                        <ul className="nav">
                            <li><a href="http://localhost:8005/home" title="">Home</a></li>
                            <li><a href="http://localhost:8005/about" title="">About</a></li>
                            <li><a href="http://localhost:8007/" title="">Project</a></li>
                            <li><a href="http://localhost:8005/contact" title="">Contact</a></li>
                            <li><a href="http://localhost:8005/login" title="">login</a></li>
                        </ul>

                        <nav className="nav-footer">
                            <p className="nav-footer-social-buttons">
                                <a className="fa-icon" href="https://www.instagram.com/" title="">
                                    <i className="fa fa-instagram"></i>
                                </a>
                                <a className="fa-icon" href="https://dribbble.com/" title="">
                                    <i className="fa fa-dribbble"></i>
                                </a>
                                <a className="fa-icon" href="https://twitter.com/" title="">
                                    <i className="fa fa-twitter"></i>
                                </a>
                            </p>
                            <p>© Untitled | Website created with <a href="http://www.mashup-template.com/"
                                                                    title="Create website with free html template">Mashup
                                Template</a>/<a href="https://www.unsplash.com/"
                                                title="Beautiful Free Images">Unsplash</a>
                            </p>
                        </nav>
                    </div>
                </nav>
            </header>

            <main className="" id="main-collapse">
                <div className="row">
                    <div className="col-xs-12 col-md-6">
                        <img className="img-responsive" alt="" src={add_image}/>
                    </div>
                    <div className="col-xs-12 col-md-6">
                        <div className="form-group">
                            <textarea className="form-control" rows="25" placeholder="Enter your message"></textarea>
                        </div>
                        <button type="submit" className="btn btn-primary btn-lg">Save</button>
                    </div>
                </div>
            </main>
        </div>


);

}

export default about_edit_user;