<template>
  <div class="managementForm">
    <div class="formIndex">
      <h1 class="title">スケジュール新規作成</h1>
      <form>
        <datetime v-model="schedule.match_date" type=datetime></datetime>
      </form>
    </div>
  </div>
</template>

<script>
import { Datetime } from 'vue-datetime'
import 'vue-datetime/dist/vue-datetime.css'


import axios from 'axios';
  export default {
    components: {
      datetime: Datetime
    },
    data: function() {
      return {
        schedule: {
          match_date: ''
        }
      }
    }
  }
</script>

<style scoped>

</style>