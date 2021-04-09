"use strict";
function greeting() {
    let pElement = document.querySelector("p");
    pElement.innerHTML = "Hello World";
}
window.onload = greeting;
