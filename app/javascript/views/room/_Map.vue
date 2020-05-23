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
import leaflet from 'leaflet'
import 'leaflet/dist/leaflet.css'

export default {
  data() {
    return {
      map: null
    }
  },
  mounted() {
    this.map = leaflet.map(this.$refs.map)

    leaflet
      .tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      })
      .addTo(this.map);

    this.map.setView([25.0408578889, 121.567904444], 15)
  }
}
</script>

<style scoped>
#map {
  height: 65vh;
}
</style>
