import TurbolinksAdapter from 'vue-turbolinks' 
import Vue from 'vue/dist/vue.esm'
import App from './components/app.vue'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
   const app = new Vue({
     el: '#hello',
     data: () => {
       return {
         message: "これはテストです"
       }
     },
     components: { App }
   })
 })