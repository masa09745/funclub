<template>
  <div id="managementContainer">
    <management-data/>
    <management-form/>
  </div>
</template>

<script>
import ManagementData from './ManagementData'
import ManagementForm from './ManagementForm'


export default {
  name: 'ManagementHome',
  
  components: {
    ManagementData,
    ManagementForm,

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
