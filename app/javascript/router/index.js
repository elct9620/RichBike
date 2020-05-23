import Vue from 'vue'
import VueRouter from 'vue-router'
import Container from 'views/layouts/Application'
import Lobby from 'views/lobby/Index'
import Room from 'views/room/Index'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect: '/lobby',
    name: 'RichBike',
    component: Container,
    children: [
      {
        path: 'lobby',
        name: '大廳',
        component: Lobby
      },
      {
        path: 'room/:id',
        name: '遊戲',
        component: Room
      }
    ]
  }
]

export default new VueRouter({
  mode: 'hash', // https://router.vuejs.org/api/#mode
  linkActiveClass: 'active',
  scrollBehavior: () => ({ y: 0 }),
  routes
})
