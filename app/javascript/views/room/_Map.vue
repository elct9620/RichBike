<template>
  <CCard>
    <CCardHeader>
      <slot name="name">
        <CIcon name="cil-user" /> 地圖
      </slot>
    </CCardHeader>
    <CCardBody>
      <div ref="map" id="map"></div>
    </CCardBody>
  </CCard>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

import leaflet from 'leaflet'
import 'leaflet.markercluster'
import 'leaflet-routing-machine'
import 'leaflet/dist/leaflet.css'

import MapIcon from 'utils/MapIcon'

export default {
  data() {
    return {
      map: null,
      markers: null
    }
  },
  props: {
    channel: { type: Object, required: true }
  },
  mounted() {
    this.initialize()
    this.channel.on('move', latLng => this.onMove(latLng))
  },
  computed: {
    ...mapGetters({
      stations: 'getStations',
    })
  },
  methods: {
    initialize() {
      this.map = leaflet.map(this.$refs.map)
      leaflet
        .tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
          attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        })
        .addTo(this.map);

      var center = [25.0408578889, 121.567904444]
      if (this.stations[0]) {
        center = [this.stations[0].latitude, this.stations[0].longitude]
      }
      this.map.setView(center, 15)
    },
    addMarkers() {
      this.stations.forEach(station => {
        const marker = leaflet
          .marker(
            [station.latitude, station.longitude],
            {
              icon: MapIcon.Bike,
              title: station.name
            }
          )
        marker.bindTooltip(station.name, { permanent: true, direction: 'top' })
        this.markers.addLayer(marker)
      })
    },
    onMove(latLng) {
      this.map.panTo(leaflet.latLng(latLng))
    }
  },
  watch: {
    stations() {
      if (!this.markers) {
        this.markers = leaflet.markerClusterGroup()
        this.map.addLayer(this.markers)
      }
      this.markers.clearLayers()
      this.addMarkers()
    }
  }
}
</script>

<style scoped>
#map {
  height: 65vh;
}
</style>
