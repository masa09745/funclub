<template>
  <div class="managementForm">
    <div class="formIndex">
      <h3 class="title">スケジュール新規作成</h3>
      <b-form class="scheduleForm">
        <b-form-group label="試合日時" >
          <datetime v-model="schedule.match_date" type=datetime ></datetime>
        </b-form-group>
        <b-form-group label="対戦相手">
          <b-form-select v-model="schedule.opponent" :options="opponents">
          </b-form-select>
        </b-form-group>
        <b-button variant="primary">作成</b-button>

      </b-form>
    </div>
  </div>
</template>

<script>
import { Datetime } from 'vue-datetime'

import axios from 'axios';
  export default {
    components: {
      datetime: Datetime
    },
    data: function() {
      return {
        schedule: {
          match_date: '',
          opponent: 'null'
        },
        opponents: [{text: '対戦相手を選んでください', value: null}, 'チームA','チームB','チームC','チームD','チームE']
      }
    },
    method:{
      onSubmit(){

      }
    }
  }
</script>

<style scoped>

.formIndex{
  width: 500px;
}
.scheduleForm{
  width: 300px;
  margin: 15px auto 0;
}
.form-group{
  margin-right: 20px;
}


</style>