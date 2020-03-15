const button = document.getElementById("near-me-unregistered")

const showMeNearMe = () => {
  if (button) {
    button.addEventListener('click', (event) => {
      event.preventDefault();
      navigator.geolocation.getCurrentPosition((data) => {
        const lat = data.coords.latitude;
        const lon = data.coords.longitude;
        console.log(lon);
        document.location.href = button.href + `?near_me=true&lat=${lat}&lon=${lon}`;
      });
    })
  }
};

export { showMeNearMe };
