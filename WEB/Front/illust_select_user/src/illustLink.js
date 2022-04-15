import logo from './logo.svg';
import './App.css';
import React, {useEffect, useState} from 'react';
import ReactDOM from "react-dom";

function IllustLink(props) {
    // const [link, setMessage_link] = useState("");

    return (
       <div>
           <header> Link 생성 </header>
           <li><a href={props.link} title="">{props.link}</a></li>

       </div>
    );

}

export default IllustLink;