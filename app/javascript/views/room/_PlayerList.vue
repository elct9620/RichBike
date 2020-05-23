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
            <td class="d-flex">
              {{ item.email.split('@')[0] }}
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
      fields: ['name']
    }
  },
  props: {
    players: { type: Array, default: [] }
  }
}
</script>
