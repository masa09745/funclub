<template>
  <div class="management-wrapper">
    <headerManagement></headerManagement>
    <div id="managementIndex">
      <stockList></stockList>
    </div>
  </div>
</template>

<script>
  import HeaderManagement from './HeaderManagement.vue'
  import StockList from './stockList.vue'

export default {
  components: {
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