<template>
  <CModal
    title="創建遊戲"
    :show="visible"
    centered
    @update:show="toggle"
  >
    <CRow>
      <CCol sm="12">
        <CInput
          label="房間名稱"
          placeholder="飛輪教室"
          :invalidFeedback="error"
          :isValid="isValid"
          v-model="roomName"
          />
      </CCol>
    </CRow>
    <template #footer>
      <button
        type="button"
        class="btn btn-primary"
        :disabled="loading"
        @click="submit"
        >
        創建
      </button>
    </template>
    <CElementCover v-if="loading" />
  </CModal>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

export default {
  data() {
    return {
      visible: this.show,
      loading: false,
      roomName: "",
      error: null
    }
  },
  props: {
    show: { type: Boolean, required: true },
  },
  watch: {
    show(value) {
      this.visible = value
    },
  },
  computed: {
    isValid() {
      if (!this.error) {
        return null
      }

      return false
    }
  },
  methods: {
    ...mapActions([
      'loadPlayers',
    ]),
    toggle(value) {
      this.$emit('update:show', value)
    },
    async submit() {
      // TODO: Refactor to use Vuex
      this.loading = true
      await this.create()
      this.loading = false
    },
    async create() {
      await fetch(
        `/api/rooms`,
        {
          method: 'POST',
          headers: new Headers({ 'Content-Type': 'application/json' }),
          body: JSON.stringify({ name: this.roomName })
        }
      )
        .then(res => res.json())
        .then(json => this.toggle(false))
        .catch(res => { this.error = '好像出了點問題' })
    }
  }
}
</script>
