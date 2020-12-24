<template>
  <div id="app">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>match_date</th>
          <th>opponent</th>
        </tr>
        <tr v-for="schedule in schedules" :key="schedule.id">
          <td>{{ schedule.id }}</td>
          <td>{{ schedule.match_date }}</td>
          <td>{{ schedule.opponent }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>

import axios from 'axios'

export default {
  data() {
    return {
      schedules: []
    }
  },
  mounted() {
    axios
      .get('/api/v1/admins.json')
      .then(response => (this.schedules = response.data))
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
td{
  width: 50px;
}
</style>
