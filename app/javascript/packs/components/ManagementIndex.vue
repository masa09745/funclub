<template>
  <div class="managementIndex">
    <div class="matchIndex">
      <h1 class="title">スケジュール一覧</h1>
      <ul class="matchList">
        <li class="matchDetails" v-for="schedule in schedules" :key="schedule.id">
          <div class="matchDate">{{ schedule.match_date | moment}}</div>
          <div class="matchOpponent">{{ schedule.opponent }}</div>
          <div class="matchLinks">
          <button class='btn btn-primary' @click="stockDetails(schedule.id)">在庫一覧</button>
          <button class='btn btn-dark' @click="deleteSchedule(schedule.id)">削除</button>
          </div>
        </li>
      </ul>
    </div>
    <div class="stockIndex" v-show="stockDetailBool">
      <h1 class="title">在庫一覧</h1>
      <table class="stockList">
        <tbody>
          <tr>
            <th>席種</th>
            <th>金額</th>
            <th>在庫量</th>
          </tr>
          <tr class="stockDetails" v-for="stock in stocks" :key="stock.id" >
            <td class="stockGrade">{{ stock.grade }}</td>
            <td class="stockPrice">{{ stock.price }}</td>
            <td class="stockRemain">{{ stock.remain }}</td>
          </tr>
        </tbody>
      </table>
    </div>
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
      stocks: {},
      stockDetailBool: false,
      schedules: []
    }
  },
  mounted: function() {
    this.fetchSchedules();
  },
  methods:{
    fetchSchedules(){
      axios.get('/api/v1/schedules.json').then(res => {
        this.schedules = res.data
      });
    },
    stockDetails(id){
      axios.get(`/api/v1/schedules/${id}`).then(res => {
        this.stocks = res.data;
        this.stockDetailBool = true;
      });
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
.managementIndex{
  display: flex;
}
.matchIndex{
  width: 500px;
}
.matchList{
  width: 390px;
  margin: 10px auto 0;
  padding: 0;
}

.matchDetails{
  height: 50px;
  display: flex;
  margin-bottom: 10px;
  line-height: 50px;
}
.matchDate{
  width: 30%
}
.matchOpponent{
  width: 30%;
}

.stockIndex{
  width: 500px;
}
.stockList{
  width: 350px;
  margin: 10px auto 0;
}
.stockGrade{
  width: 20%
}
.stockPrice{
  width: 25%;
}
.stockRemain{
  width: 25%;
}

</style>
