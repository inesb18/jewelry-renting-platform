import "bootstrap";
import { updatePrice } from '../components/total_price';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { showMeNearMe } from '../components/near_me_unregistered';

console.log("Hello");

updatePrice();

initAutocomplete();

showMeNearMe();
