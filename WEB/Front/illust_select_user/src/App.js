import logo from './logo.svg';
import './App.css';
import React, { useEffect, useState } from 'react';

function App() {
  const [style, setStyle] = useState("unclicked");
  const [image, setImage] = useState([]);
  const numbers = ['img-12.jpg', 'img-11.jpg', 'img-10.jpg'];
  const clicked_photo = [];

  function inputClickEvent(element_id) { // 클릭 이벤트 삽입
    var input = document.getElementById(element_id)
		input.addEventListener('click', function(e) { // input 에 이벤트 리스너 삽입.
			if (input.classList.contains("clicked")) { // clicked는 css 스타일 추가 (외곽선) 해주는 연산.
				input.classList.remove("clicked");
        var index = clicked_photo.indexOf(element_id)
        if (index !== -1) {
          clicked_photo.splice(index, 1);
        }
        console.log(clicked_photo); // result

			} else {
				input.classList.add("clicked");
        clicked_photo.push(element_id);
        console.log(clicked_photo); // result
			}
		})
	}


  // const [message, setMessage] = useState("1")
  // const [message2, setMessage2] = useState("2")

  // useEffect(()=>{
  //   fetch("/illust_select_user1")
  //       .then(res => res.text())
  //       .then(m=>setMessage(m))
  // }, [])

  // useEffect(()=>{
  //   fetch("/illust_select_user2")
  //       .then(res => res.text())
  //       .then(m=>setMessage2(m))
  // }, [])

  return (
    <div>
      {numbers.map((photo, index) => (
        <img id={photo} class="img-responsive" alt="" src={photo} onClick={() => inputClickEvent(photo)}/>
      ))}
    </div>
  );

}

export default App;