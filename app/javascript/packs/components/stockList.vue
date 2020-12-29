<template>
  <div class="stockList">
    <table>
      <tbody>
        <tr>
          <th>対戦日</th>
          <th>対戦相手</th>
          <th>席種</th>
          <th>金額</th>
          <th>残り座席数</th>
          
        </tr>
        <tr v-for="stock in stocks" :key="stock.id">
          <td class="stockDate">{{ stock.schedule.match_date | moment }}</td>
          <td class="stockOpponent">{{ stock.schedule.opponent }}</td>
          <td class="stockGrade">{{ stock.grade}}</td>
          <td class="stockPrice">{{ stock.price }}</td>
          <td class="stockRemain">{{ stock.remain }}</td>


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
.stockList{
  width: 500px;
  padding: 10px;
}

.stockDate{
  width: 30%;
}
.stockOpponent{
  width: 20%;
}

.stockGrade{
  width: 10%;
}

.stockPrice{
  width: 20%;
}
</style>
