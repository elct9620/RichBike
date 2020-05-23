<template>
  <CCard>
    <CCardHeader>
      <slot name="name">
        <CIcon name="cil-user" /> {{ name }}
      </slot>
    </CCardHeader>
    <CCardBody>
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
    name: { type: String, required: true}
  }
}
</script>
