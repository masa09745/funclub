<template>
  <div id="managementContainer">
    <scheduleList></scheduleList>
  </div>
</template>

<script>
import ScheduleList from './ManagementIndex.vue'

export default {
  components: {
    ScheduleList
  }
}
</script>

<style scoped>
#managementContainer{
  padding-top: 155px;
  min-width: 450px;
  max-width: 1000px;
  margin: 0 auto;
  background-color: #ffffff;
}
</style>