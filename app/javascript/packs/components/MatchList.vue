<template>
  <li class="matchDetails">
    <div class="matchDate">{{ schedule.match_date | moment}}</div>
    <div class="matchOpponent">{{ schedule.opponent }}</div>
    <div class="matchLinks">
    <button class='btn btn-primary' @click="$emit('show',schedule.id)">在庫一覧</button>
    <button class='btn btn-dark' @click="$emit('remove',schedule.id)">削除</button>
    </div>
  </li>
</template>

<script>
import moment from 'moment'

export default {
    filters: {
    moment: function(match_date){
      return moment(match_date).format('YYYY/MM/DD')
    }
  },
  props: ["schedule"]

}
</script>

<style scoped>

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

</style>