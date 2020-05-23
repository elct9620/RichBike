<template>
  <div class="c-app c-dark-theme">
    <div class="c-wrapper">
      <CHeader fixed with-subheader light>
        <CSubheader class="px-3">
          <CBreadcrumbRouter class="border-0 m-0 px-0 px-md-3"/>
        </CSubheader>
      </CHeader>
      <div class="c-body">
        <main class="c-main">
          <CContainer fluid>
            <transition name="fade">
              <router-view></router-view>
            </transition>
          </CContainer>
        </main>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'App',
  components: {
  }
}
</script>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s;
}
.fade-enter,
.fade-leave-to {
  opacity: 0;
}
</style>
