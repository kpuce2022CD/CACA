
import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';


function App() {
  const numbers = ['img-12.jpg', 'img-11.jpg', 'img-10.jpg', 'img-09.jpg'
  , 'img-08.jpg', 'img-07.jpg', 'img-06.jpg', 'img-05.jpg'];

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
      <main class="" id="main-collapse">
        
            <div>
              {numbers.map((photo, index) => (
                <div class="grid-item">
                  <img id={photo} class="img-responsive" alt="" src={photo} />
                  <a href="./project.html" class="project-description">
                    <div class="project-text-holder">
                      <div class="project-text-inner">
                        <h3>{photo}</h3>
                        <p>{photo} / {photo}</p>
                      </div>
                    </div>
                  </a>
                </div>
              ))}
            </div>


      </main>
    </div>

  );
}

export default App;