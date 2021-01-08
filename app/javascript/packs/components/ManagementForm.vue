<template>
  <div class="managementForm">
    <div class="formIndex">
      <h3 class="title">スケジュール新規作成</h3>
      <b-form class="scheduleForm">
        <b-form-group label="試合日" >
          <b-form-datepicker v-model="schedule.match_date" placeholder="試合日を選んでください" today-button reset-button close-button locale="ja"></b-form-datepicker>
        </b-form-group>
        <b-form-group label="開始時間" >
          <b-form-timepicker v-model="schedule.match_time" placeholder="開始時間を入力してください" now-button reset-button locale="ja"></b-form-timepicker>
        </b-form-group>
        <b-form-group label="対戦相手">
          <b-form-select v-model="schedule.opponent" :options="opponents">
          </b-form-select>
        </b-form-group>
        <b-button variant="primary" @click="createSchedule">作成</b-button>

      </b-form>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  data: function() {
    return {
      schedule: {
        match_date: '',
        match_time: '',
        opponent: 'null'
      },
      opponents: [{text: '対戦相手を選んでください', value: null}, 'チームA','チームB','チームC','チームD','チームE']
    }
  },
  methods:{
    createSchedule(){
      const reroad = ref(false)
      axios.post('/api/v1/schedules', {schedule: this.schedule}).then(res => {
        
      })
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