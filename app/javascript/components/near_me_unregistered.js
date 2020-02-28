const button = document.getElementById("near-me-unregistered")

const showMeNearMe = () => {
  if (button) {
    navigator.geolocation.getCurrentPosition((data) => {
      const lat = data.coords.latitude;
      const lon = data.coords.longitude;
      button.href = button.href + `&near_me=true&lat=${lat}&lon=${lon}`;
    });
  }
};

export { showMeNearMe };
