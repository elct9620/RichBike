<template>
  <CCard>
    <CCardHeader>
      <slot name="name">
        <CIcon name="cil-user" /> 事件
      </slot>
    </CCardHeader>
    <CCardBody>
      <CDataTable
          hover
          :header="false"
          :items="events"
          :fields="fields"
          >
          <template #message="{ item }">
            <td>
              {{ item.user.email.split('@')[0] }} {{ item.message }}
            </td>
          </template>
      </CDataTable>
    </CCardBody>
  </CCard>
</template>

<script>
export default {
  data() {
    return {
      fields: [{
        key: 'message',
        label: '事件'
      }]
    }
  },
  props: {
    events: { type: Array, default: [] }
  },
}
</script>
