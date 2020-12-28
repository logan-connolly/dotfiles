function greeting() {
  let pElement = document.querySelector("p")! as HTMLParagraphElement;
  pElement.innerHTML = "Hello World";
}

window.onload = greeting;
