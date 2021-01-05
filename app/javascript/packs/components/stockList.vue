<template>
  <div class="matchIndex">
    <h1 class="title">スケジュール一覧</h1>
    <table class="matchList">
      <tbody>
        <tr>
          <th>対戦日</th>
          <th>対戦相手</th>
        </tr>
        <tr class="matchDetails" v-for="stock in stocks" :key="stock.id">
          <td class="matchDate">{{ stock.schedule.match_date | moment}}</td>
          <td class="matchOpponent">{{ stock.schedule.opponent }}</td>
          <td class="matchLinks">
          <button class='btn btn-primary'>詳細</button>
          <button class='btn btn-dark'>削除</button>
          </td>
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
      return moment(match_date).format('YYYY/MM/DD')
    }
  },

  data() {
    return {
      stocks: []
    }
  },
  mounted() {
    axios
      .get('/api/v1/stocks.json')
      .then(response => (this.stocks = response.data))
  }
}
</script>

<style scoped>
.matchList{
  width: 350px;
  margin: 10px 65px 0;
}

.matchDate{
  width: 32%
}

.matchOpponent{
  width: 32%;
}
</style>
