<template>
  <CCard>
    <CCardHeader>
      <slot name="name">
        <CIcon name="cil-user" /> {{ name }}
      </slot>
    </CCardHeader>
    <CCardBody>
      <div class="text-right">
        <CButton
          color="primary"
          class="ml-auto"
          @click="join"
          >
          加入
        </CButton>
      </div>
    </CCardBody>
  </CCard>
</template>

<script>
export default {
  default() {
    return {
    }
  },
  props: {
    name: { type: String, required: true},
    id: { type: Number, required: true }
  },
  methods: {
    async join() {
      await fetch(
        `/api/rooms/${this.id}/join`,
        {
          method: 'POST',
          headers: new Headers({ 'Content-Type': 'application/json' }),
        }
      )
        .then(res => res.json())
        // TODO: Handle Error
    }
  }
}
</script>
