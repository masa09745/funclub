<template>
  <div class="scheduleList">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>試合日時</th>
          <th>対戦相手</th>
        </tr>
        <tr v-for="schedule in schedules" :key="schedule.id">
          <td class="scheduleId">{{ schedule.id }}</td>
          <td class="scheduleDate">{{ schedule.match_date | moment}}</td>
          <td class="scheduleOpponent">{{ schedule.opponent }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>

import axios from 'axios'
import moment from 'moment'


export default {
    filters: {
      moment: function(match_date){
        return moment(match_date).format('YYYY/MM/DD HH:mm')
      }
  },

  data() {
    return {
      schedules: []
    }
  },
  mounted() {
    axios
      .get('/api/v1/schedules.json')
      .then(response => (this.schedules = response.data))
  }
}
</script>

<style scoped>
.scheduleList{
  width: 500px;
  height: 500px;
  padding: 30px;
}

.scheduleId{
  width: 10%;
}

</style>
