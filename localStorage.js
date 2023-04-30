function store() {
  // get user input
  let input = document.getElementById("userInput");
  // save user input
  localStorage.setItem("userInput", input.value);
  // saving initial count
  let count = 0;
  localStorage.setItem("count", count);
}

function breakThing() {
  count = parseInt(localStorage.count);
  count = count + 1;
  localStorage.setItem("count", count);
}
