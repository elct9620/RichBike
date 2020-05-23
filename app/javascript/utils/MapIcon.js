import leaflet from 'leaflet'
import BikeIcon from 'assets/bike.png'

const Bike = leaflet.icon({
  iconUrl: BikeIcon,
  iconSize: [32, 32],
  iconAnchor: [16, 16],
})

export default {
  Bike: Bike
}
