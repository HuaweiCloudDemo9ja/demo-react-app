import React, { useState, useEffect } from 'react';
import './App.css';

function App() {
  const [dateTime, setDateTime] = useState(new Date());

  useEffect(() => {
    const timer = setInterval(() => setDateTime(new Date()), 1000);
    return () => clearInterval(timer);
  }, []);

  return (
    <div className="App" style={{ textAlign: 'center', marginTop: '50px' }}>
      <h1>{process.env.REACT_APP_APP_NAME}</h1>
      <h2>Current Date & Time:</h2>
      <p style={{ fontSize: '20px' }}>
        {dateTime.toLocaleString()}
      </p>
    </div>
  );
}

export default App;
