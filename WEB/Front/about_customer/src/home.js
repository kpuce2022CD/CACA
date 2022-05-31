import logo from './logo.svg';
import {useEffect, useState} from 'react';
import Subject from './Subject.jsx';
import logo1 from './images/clonet_logo_white.png';

import './Theme1.css';
// import './Theme2.css'
// import './Theme3.css';
// import './Theme4.css';

function Home() {
    return (
        <div>
            <Subject />
            <main className="" id="main-collapse">
                <div className="row">
                    <div>
                        <center>
                            <header>
                                {/* <img src="http://13.209.116.111/images/Clonet_logo.jpeg" className="App-logo" alt="logo" /> */}
                                {/* <img src={logo1} className="App-logo" alt="logo" /> */}
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

export default Home;