<template>
  <div class="managementIndex">
    <div class="matchIndex">
      <h1 class="title">スケジュール一覧</h1>
      <div class="matchIndex__text">スケジュールを追加する</div>
      <ul class="matchList" v-if="schedules.length">
        <div class="matchList__index">
          <div>試合日</div>
          <div>対戦相手</div>
        </div>
        <MatchList v-for="schedule in schedules" :key="schedule.id" :schedule="schedule" @remove="deleteSchedule" @show="stockDetails" />
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
import MatchList from './MatchList'

axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  components: {
    MatchList
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
.matchIndex__text{
  margin: 10px 50px;
  text-align: right;
}
.matchList{
  width: 390px;
  margin: 10px auto 0;
  padding: 0;
}

.matchList__index{
  display: flex;
  width: 183px;
  justify-content: space-between;
  font-weight: bold;
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
