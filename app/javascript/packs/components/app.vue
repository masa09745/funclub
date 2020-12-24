<template>
  <div class="management-wrapper">
    <headerManagement></headerManagement>
    <div id="managementIndex">
      <scheduleList></scheduleList>
      <stockList></stockList>
    </div>
  </div>
</template>

<script>
  import ScheduleList from './scheduleList.vue'
  import HeaderManagement from './HeaderManagement.vue'
  import StockList from './stockList.vue'

export default {
  components: {
    ScheduleList,
    HeaderManagement,
    StockList
  }
}
</script>

<style scoped>
#managementIndex{
  display: flex;
}
</style>