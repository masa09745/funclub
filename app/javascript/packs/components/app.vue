<template>
  <div id="managementContainer">
    <management-index></management-index>
    <management-form></management-form>
  </div>
</template>

<script>
import ManagementIndex from './ManagementIndex.vue'
import ManagementForm from './ManagementForm.vue'

export default {
  components: {
    ManagementIndex,
    ManagementForm
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