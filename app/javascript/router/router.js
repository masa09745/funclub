import Vue from 'vue'
import VueRouter from 'vue-router'
import ManagementHome from '../packs/components/ManagementHome'

Vue.use(VueRouter)

const routes = [
  {path: '/', name: 'ManagementHome', component: ManagementHome},
];

export default new VueRouter({routes});

