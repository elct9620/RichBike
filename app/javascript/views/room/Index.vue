<template>
  <div>
    <div class="row">
      <div class="col-md-8">
        <Map />
      </div>
      <div class="col-md-4">
        Player & Events
      </div>
    </div>
  </div>
</template>

<script>
import Map from './_Map'

export default {
  data() {
    return {
    }
  },
  components: {
    Map
  }
}
</script>
