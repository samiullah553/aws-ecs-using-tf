import './App.css';
import { useEffect, useState } from "react";

function App() {
  const [message, setMessage] = useState("");

  useEffect(() => {
    // fetch("http://localhost:5000/api/v1")
    fetch("https://demo-api-hyftbyg9abb2dab3.southindia-01.azurewebsites.net/api/demo-api")
      .then((res) => res.json())
      .then((data) => {
        setMessage(data.msg);
      })
      .catch((err) => console.error(err));
  }, []);

  return (
    <div className="App">
      <header className="App-header">
      <h1>Response from serverless:</h1>
      <h1>{message}</h1>
      </header>
    </div>
  );
}

export default App;
