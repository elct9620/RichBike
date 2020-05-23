<template>
  <CCard>
    <CCardHeader>
      <slot name="name">
        <CIcon name="cil-user" /> 玩家
      </slot>
    </CCardHeader>
    <CCardBody>
      <CDataTable
          hover
          :items="players"
          :fields="fields"
          >
          <template #name="{ item }">
            <td>
              {{ item.user.email.split('@')[0] }}
            </td>
          </template>
          <template #station="{ item }">
            <td>
              {{ item.station.name }}
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
        key: 'name',
        label: '名稱'
      }, {
        key: 'station',
        label: '站點'
      }]
    }
  },
  props: {
    players: { type: Array, default: [] }
  }
}
</script>
