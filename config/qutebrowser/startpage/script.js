function updateClock() {
  const now = new Date();
  hours = now.getHours().toString().padStart(2, "0");
  minutes = now.getMinutes().toString().padStart(2, "0");
  time = hours + ":" + minutes;
  document.getElementById("time").innerHTML = time;
  setTimeout(updateClock, 1000);
}

updateClock();
