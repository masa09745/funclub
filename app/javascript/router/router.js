import Vue from 'vue'
import VueRouter from 'vue-router'
import ManagementHome from '../packs/components/ManagementHome'
import CreateSchedule from '../packs/components/CreateSchedule'

Vue.use(VueRouter)

const routes = [
  {path: '/', name: 'ManagementHome', component: ManagementHome},
  {path: '/create', component: CreateSchedule}
];

export default new VueRouter({routes});

