import logo from './logo.svg';
import './App.css';
import React, { useEffect, useState } from 'react';
import ReactDOM from "react-dom";
import illustLink from './illustLink.js';
import Subject from './Subject.jsx';

function App() {
    const [style, setStyle] = useState("unclicked");
    const clicked_photo = [];
    const [numbers, setMessage_numbers] = useState([]);
    const [link, setLink] = useState("http://localhost:8006/piece?user_id=");
    var final_link

    const handleClick = (e) => {
        final_link = ""
        final_link = link + clicked_photo.toString().trim()
        console.log(final_link);

        window.location.href = final_link
    }

    var rr;
    var num;

    // 로그인 정보 받아와서 로그인 확인하기
    const [user_login, setMessageLogin] = useState("Login");

    useEffect(() => {

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
                return res.text().then(function (data) {
                    if (data != null) {
                        console.log('로그인 성공_select_user', data);
                        setMessageLogin(data + "  님");
                        setLink(link + data + "&piece=")

                        return fetch("http://localhost:8087/piece_u?user_id=" + data, {
                            method: "POST",
                            headers: new Headers({
                                'Accept': 'application/json',
                                'Content-Type': 'application/json'
                            }),
                        })
                            .then(res => {
                                rr = res.clone();
                                res.text();
                                rr.text().then(function (text) {
                                    console.log(text)
                                    num = text.toString().split(",")

                                    // console.log(num);
                                    for (var i = 0; i < num.length; i++) {
                                        if (num[i].includes(".png") || num[i].includes(".JPG")) {
                                            numbers.push(num[i]);
                                        }
                                    }
                                    console.log(numbers);
                                    // reload
                                    setMessage_numbers([...numbers]);
                                    return;
                                });
                            })

                    } else {
                        console.log('로그인 안됨', data);
                    }
                })
            })

    }, [])

    // .then(data => {
    // if (data != null) {
    //     console.log('로그인 성공_select_user', data);
    //     setMessageLogin(data + "  님");
    //
    //     // DB에서 아이디로 Repository 정보 받아오기 http://localhost:8087/piece_u?user_id=user1
    //
    //         fetch("http://localhost:8087/piece_u?user_id=" + data, {
    //             method: "POST",
    //             headers: new Headers({
    //                 'Accept': 'application/json',
    //                 'Content-Type': 'application/json'
    //             }),
    //         })
    //             .then(res => {
    //                 rr = res.clone();
    //                 res.text();
    //                 rr.text().then(function (text){
    //                     console.log(text)
    //                     num = text.toString().split(",")
    //
    //                     // console.log(num);
    //                     for(var i=0; i < num.length; i++) {
    //                         if (num[i].includes(".png")) {
    //                             setMessage_numbers([...numbers, num[i]]);
    //                         }
    //                     }
    //                     console.log(numbers);
    //                     return;
    //                 });
    //             })
    //
    // } else {
    //     console.log('로그인 안됨', data);
    // }
    // })

    // Front Parameter 받기

    function getQueryVariable(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] == variable) {
                return pair[1];
            }
        }
        return (false);
    }


    // 이미지 선택
    function inputClickEvent(element_id) { // 클릭 이벤트 삽입
        var input = document.getElementById(element_id)
        input.addEventListener('click', function (e) { // input 에 이벤트 리스너 삽입.
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


    return (
        <div>
            <Subject name={user_login} />
            <div align={"center"}>
                <div id="reRender">
                    {numbers.map((photo, index) => (
                        <img id={photo} className="img-responsive" width="500px" height="500px" alt="" src={"http://3.35.46.50/clonet-repo/" + photo}
                             onClick={() => inputClickEvent(photo)} />
                        // <img id={photo} class="img-responsive" alt="" src={photo} onClick={() => inputClickEvent(photo)}/>
                    ))}
                </div>
                
                <button type="submit" className="btn btn-primary btn-lg" onClick={handleClick}>Link</button>
            </div>
        </div>
    );
}




export default App;
