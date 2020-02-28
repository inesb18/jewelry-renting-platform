import "bootstrap";
import { updatePrice } from '../components/total_price';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { showMeNearMe } from '../components/near_me_unregistered';
import { responsiveRatingStars } from '../components/responsive_rating_stars';


responsiveRatingStars();

updatePrice();

initAutocomplete();

showMeNearMe();
