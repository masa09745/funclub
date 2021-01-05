<template>
  <div class="matchIndex">
    <h1 class="title">スケジュール一覧</h1>
    <table class="matchList">
      <tbody>
        <tr>
          <th>対戦日</th>
          <th>対戦相手</th>
        </tr>
        <tr class="matchDetails" v-for="schedule in schedules" :key="schedule.id">
          <td class="matchDate">{{ schedule.match_date | moment}}</td>
          <td class="matchOpponent">{{ schedule.opponent }}</td>
          <td class="matchLinks">
          <button class='btn btn-primary' @click="stockDetails(schedule.id)">在庫一覧</button>
          <button class='btn btn-dark' @click="deleteSchedule(schedule.id)">削除</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>

import axios from 'axios'
import { csrfToken } from 'rails-ujs'
import moment from 'moment'

axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  filters: {
    moment: function(match_date){
      return moment(match_date).format('YYYY/MM/DD')
    }
  },

  data() {
    return {
      schedules: []
    }
  },
  mounted: function() {
    this.fetchSchedules();
  },
  methods:{
    fetchSchedules(){
      axios.get('/api/v1/schedules.json')
      .then(response => (this.schedules = response.data))
    },
    deleteSchedule(id){
      axios.delete(`/api/v1/schedules/${id}`).then(res => {
        this.schedules = [];
        this.fetchSchedules();
      })
    }
  }
}
</script>

<style scoped>
.matchList{
  width: 450px;
  margin: 10px 50px 0;
}

.matchDate{
  width: 32%
}

.matchOpponent{
  width: 32%;
}
</style>
