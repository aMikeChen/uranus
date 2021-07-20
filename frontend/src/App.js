import { useState, useEffect } from 'react'
import axios from 'axios'
import './App.css';

function App() {
  const [price, setPrice] = useState(0)

  useEffect(() => {
    async function fetchPrice() {
      const { data: { price: newPrice } } = await axios.get('http://localhost:4000/api/currency/BTC-USD')
      setPrice(newPrice)
    }

    fetchPrice()
  })

  return (
    <div className="App">
      <header className="App-header">
        <p>
          {price}
        </p>
      </header>
    </div>
  );
}

export default App;
