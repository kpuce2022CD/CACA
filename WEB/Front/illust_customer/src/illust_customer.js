import './Theme1.css';
import Subject from './Subject.jsx'
import {useEffect, useState} from 'react';

function useIllust_customer() {
  // const numbers = ['img-12.jpg', 'img-11.jpg', 'img-10.jpg', 'img-09.jpg', 'img-08.jpg', 'img-07.jpg', 'img-06.jpg', 'img-05.jpg'];
  const numbers = getQueryVariable("piece").toString().split(',');
  console.log(numbers);

  numbers.map((photo, index) => (
    console.log("http://3.35.46.50/clonet-repo/" + photo)
  ))
  // Front Parameter 받기
  const piece = getQueryVariable("piece");
  function getQueryVariable(variable){
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
      var pair = vars[i].split("=");
      if(pair[0] == variable){
        return pair[1];
      }
    }
    return(false);
  }

  // Back으로 보내기
  const config = {
    headers : {
      'Accept' : 'application/json'
    }
  }
  fetch(`http://localhost:8086/piece?piece=${piece}`, config)

  const user_id = getQueryVariable("user_id");
  console.log("user_id: "+ user_id);
  console.log("pieceList: "+ piece);
  const [link, setLink] = useState("http://localhost:8006/piece?piece=" + piece+ "&user_id=" + user_id );
  console.log("입력된 url: " + link);

  fetch("http://localhost:8081/?user_id=" + user_id + "&piece=" + piece, {
        method: "POST",
        headers: new Headers({
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        }),
    })
        // .then(res => {
        //     if (!res.ok) {
        //         throw Error("could not fetch the data that resource");
        //     }
        //     return res.text();
        // })

       
  // View
    return (
        <div>
      <Subject link={link}/>
      <main class="" id="main-collapse">


        <div class="hero-full-wrapper">
          <div class="grid">
            <div class="gutter-sizer"></div>
            <div class="grid-sizer"></div>

            <div>
              {numbers.map((photo, index) => (
                <div class="grid-item">
                  <img id={photo} class="img-responsive" alt="" src={"http://3.35.46.50/clonet-repo/" + photo} />
                  <a href="./project.html" class="project-description">
                    <div class="project-text-holder">
                      <div class="project-text-inner">
                        {photo}
                      </div>
                    </div>
                  </a>
                </div>
              ))}
            </div>
          </div>
        </div>
      </main>
    </div>
)
    ;
}

export default useIllust_customer;