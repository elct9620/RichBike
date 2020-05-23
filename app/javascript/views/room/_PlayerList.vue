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
          <template #calories="{ item }">
            <td>{{ item.calories }}</td>
          </template>
      </CDataTable>
    </CCardBody>
    <CCardFooter>
      <div class="text-right">
        <button
          type="button"
          class="btn btn-primary"
          @click="roll"
          >
          行動
        </button>
      </div>
    </CCardFooter>
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
      }, {
        key: 'calories',
        label: '卡路里'
      }]
    }
  },
  props: {
    players: { type: Array, default: [] }
  },
  methods: {
    async roll() {
      const res = await fetch(
        `/api/rooms/${this.$route.params.id}/roll`,
        {
          method: 'POST',
          headers: new Headers({ 'Content-Type': 'application/json' }),
        }
      ).then(res => res.json())
    }
  }
}
</script>
