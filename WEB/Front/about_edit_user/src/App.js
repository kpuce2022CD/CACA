

import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';

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

function App() {
    const [text, setText] = useState("");
    const onChange = (e) => {
        setText(e.target.value);
    };

    const onReset = () => {
        setText("");
    };
  return (
      <div className="App">
        <header className="about_edit_user">
            About_Edit_User
        </header>
          <img src={logo} className="App-logo" alt="logo" />
          <input onChange={onChange} value={text} />
          <div>
              <button>Save</button>
              <button>Cancel</button>
          </div>


      </div>
  );
}

export default App;