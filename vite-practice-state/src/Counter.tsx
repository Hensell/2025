import { useState } from "react";

function Counter() {
  const [counter, setCounter] = useState(0);

  function handleSum() {
  setCounter(counter => ++counter);
  }

function handleSustraction(){

    setCounter(counter=> --counter);
}

  return (
    <>
      <p>{counter}</p>
      <button onClick={handleSum}>sumar</button>
      <button onClick={handleSustraction}>resta</button>
    </>
  );
}

export default Counter;
