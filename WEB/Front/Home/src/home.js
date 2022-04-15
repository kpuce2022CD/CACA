import logo from './logo.svg';
import {useEffect, useState} from 'react';
import Subject from './Subject.jsx';

import './Theme1.css';
import ReactDOM from "react-dom";
// import './Theme2.css'
// import './Theme3.css';
// import './Theme4.css';

function useHome() {
    const [user_login, setMessageLogin] = useState("Login");
    fetch("http://localhost:8085/auth", {
        method: "POST",
        headers: new Headers({
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        }),
    })
        .then(res => {
            if (!res.ok) {
                throw Error("could not fetch the data that resource");
            }
            return res.text();
        })
        .then(data => {

            if(data != null){
                console.log('로그인 성공', data);
                setMessageLogin(data+"  님");
            } else{
                console.log('로그인 안됨', data);
            }
        });


    return (
        <div>
            <Subject />
            <main className="" id="main-collapse">
                <div className="row">
                    <div>
                        <center>
                            <header>
                                <img src="http://13.209.116.111/images/Clonet_logo.jpeg" className="App-logo" alt="logo" />
                                <p className="clonet-head">CLONET</p>
                            </header>
                        </center>

                    </div>
                </div>


            </main>
        </div>
    )
        ;
}

export default useHome;