<template>
  <div class="management-wrapper">
    <headerManagement></headerManagement>
    <scheduleList></scheduleList>
  </div>
</template>

<script>
  import ScheduleList from './scheduleList.vue'
  import HeaderManagement from './HeaderManagement.vue'

export default {
  components: {
    ScheduleList,
    HeaderManagement
  }
}
</script>