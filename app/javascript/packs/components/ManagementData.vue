<template>
  <div class="managementIndex">
    <div class="matchIndex">
      <h1 class="title">スケジュール一覧</h1>
      <router-link to="/create" class="matchIndex__text">スケジュールを追加する</router-link>
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
      <div class="stockIndex__text" @click="createStock">在庫情報を追加する</div>
      <ul class="stockList">
        <div class="stockList__index">
            <div>席種</div>
            <div>金額</div>
            <div>在庫量</div>
        </div>
        <StockList v-for="stock in stocks" :key="stock.id" :stock="stock" />
      </ul>
        <StockForm :schedule_id="id" v-bind.sync="stock" :options="options" @submit="createStock"/>
        <div>
          入力内容
            <div>
              {{stock.grade}}
            </div>
            <div>
              {{stock.price}}
            </div>
            <div>
              {{stock.remain}}
            </div>
        </div>
    </div>
  </div>
</template>

<script>

import axios from 'axios'
import { csrfToken } from 'rails-ujs'
import moment from 'moment'
import MatchList from './MatchList'
import StockList from './StockList'
import StockForm from './StockForm'

axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  components: {
    MatchList,
    StockList,
    StockForm
  },
  data() {
    return {
      id: 0,
      stocks: {},
      stockDetailBool: false,
      schedules: [],
      stock: {
        grade: '',
        price: '',
        remain: ''
      },
      options: [{label:"S", value:"S"},{label:"A", value:"A"},{label:"B", value:"B"},{label:"C", value:"C"}]
    }
  },
  mounted: function() {
    this.fetchSchedules();
  },

  methods:{
    fetchSchedules(){
      axios.get('/api/v1/schedules.json').then(res => {
        this.schedules = res.data;
      });
    },
    stockDetails(id){
      axios.get(`/api/v1/schedules/${id}/stocks`).then(res => {
        this.stocks = res.data;
        this.stockDetailBool = true;
      });
    },
    deleteSchedule(id){
      axios.delete(`/api/v1/schedules/${id}`).then(res => {
        this.schedules = [];
        this.fetchSchedules();
      })
    },
    createStock(id){
      axios.post(`/api/v1/schedules/${id}/stocks`, {stock: this.stock}).then(res => {
        console.log(res.data);
        this.$router.push({ path: '/'});
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
  display: block;
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

.stockIndex__text{
  margin: 10px 50px;
  text-align: right;
}

.stockList{
  width: 300px;
  padding: 0;
  margin: 10px auto 0;
}

.stockList__index{
  display: flex;
  width: 247px;
  justify-content: space-between;
  font-weight: bold;
}


</style>
