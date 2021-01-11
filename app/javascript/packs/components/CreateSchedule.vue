<template>
  <div class="CreateSchedule">
    <div class="formIndex">
      <h3 class="title">スケジュール新規作成</h3>
      <ScheduleForm v-bind.sync="schedule" :options="options" @submit="createSchedule"/>
    </div>
    <div>
      入力内容
        <div>
        {{schedule.match_date}}
        </div>
        <div>
        {{schedule.match_time}}
        </div>
        <div>
        {{schedule.opponent}}
        </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
import ScheduleForm from './ScheduleForm'

axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  components: {
    ScheduleForm
  },
  data() {
    return {
      schedule: {
        match_date: '',
        match_time: '',
        opponent: ''
      },
      options: [{label:"チームA", value:"チームA"},{label:"チームB", value:"チームB"},{label:"チームC", value:"チームC"},{label:"チームD", value:"チームD"},{label:"チームE", value:"チームE"}]
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