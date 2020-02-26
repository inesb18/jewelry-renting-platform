const rentalForm = document.getElementById('new_rental');
const startDate = document.getElementById("rental_start_date");
const endDate = document.getElementById("rental_end_date");
const priceElement = document.getElementById("total_price");


const nbDays = () => {
  const date1 = new Date(startDate.value);
  const date2 = new Date(endDate.value);
  const differenceInTime = date2.getTime() - date1.getTime();
  const differenceInDays = differenceInTime / (1000 * 3600 * 24);
  return differenceInDays;
};

const displayPrice = () => {
  const dailyPrice = document.getElementById("price").dataset.amountCents;
  const nbDaysRent = nbDays();
  const totalPrice = nbDaysRent * dailyPrice / 100.0;
  if (totalPrice > 0) {
    priceElement.innerText = totalPrice.toString(10);
  } else {
    priceElement.innerText = '';
  }
}

const updatePrice = () => {
  if (rentalForm) {
    displayPrice();
    endDate.addEventListener('input', (event) => {
      if (startDate.value.length) {
        displayPrice();
      }
    });
    startDate.addEventListener('input', (event) => {
      if (endDate.value.length) {
        displayPrice();
      }
    });
  }
};

export { updatePrice };
