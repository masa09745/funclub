<template>
  <div class="CreateSchedule">
    <div class="formIndex">
      <h3 class="title">スケジュール新規作成</h3>
      <b-form class="scheduleForm">
        <div class="form-row">
          <b-form-group label="試合日" class="col">
            <b-form-datepicker v-model="schedule.match_date" placeholder="----/--/--" :date-format-options="{year: 'numeric', month: '2-digit', day: '2-digit'}" today-button reset-button close-button locale="ja"></b-form-datepicker>
          </b-form-group>
          <b-form-group label="開始時間" class="col">
            <b-form-timepicker v-model="schedule.match_time" placeholder="--:--" now-button reset-button locale="ja"></b-form-timepicker>
          </b-form-group>
          <b-form-group label="対戦相手" class="col">
            <b-form-select v-model="schedule.opponent" :options="opponents">
            </b-form-select>
          </b-form-group>
        </div>
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
      opponents: [{text: '----', value: null}, 'チームA','チームB','チームC','チームD','チームE']
    }
  },
  methods:{
    createSchedule(){
      axios.post('/api/v1/schedules', {schedule: this.schedule}).then(res => {
        this.$router.push({ path: '/'});
      })
    }
  }
}
</script>

<style scoped>
.CreateSchedule{
  padding-top: 155px;
  min-width: 450px;
  max-width: 1000px;
  margin: 0 auto;
  background-color: #ffffff;
}

.formIndex{
  width: 700px;
}
.scheduleForm{
  width: 500px;
  margin: 15px auto 0;
}

</style>