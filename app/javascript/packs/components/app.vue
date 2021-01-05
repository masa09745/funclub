<template>
  <div id="managementIndex">
    <stockList></stockList>
  </div>
</template>

<script>
  import StockList from './stockList.vue'

export default {
  components: {
    StockList
  }
}
</script>

<style scoped>
#managementIndex{
  padding-top: 155px;
  min-width: 450px;
  max-width: 800px;
  margin: 0 auto;
  background-color: #ffffff;
  display: flex;
}
</style>