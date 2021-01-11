<template>
<b-form class="scheduleForm">
  <div class="form-row">
    <b-form-group label="試合日" class="col">
      <b-form-datepicker v-model="match_dateComputed" placeholder="----/--/--" :date-format-options="{year: 'numeric', month: '2-digit', day: '2-digit'}" today-button reset-button close-button locale="ja"></b-form-datepicker>
    </b-form-group>
    <b-form-group label="開始時間" class="col">
      <b-form-timepicker v-model="match_timeComputed" placeholder="--:--" now-button reset-button locale="ja"></b-form-timepicker>
    </b-form-group>
    <b-form-group label="対戦相手" class="col">
      <b-form-select v-model="opponentComputed">
        <template v-for="(option, index) in options">
          <option :value="option.value" :key="index">{{option.label}}</option>
        </template>
      </b-form-select>
    </b-form-group>
  </div>
  <b-button variant="primary" @click="$emit('submit',schedule.id)">作成</b-button>
</b-form>
</template>

<script>
export default {
  props: {
    match_date: String,
    match_time: String,
    opponent: String,
    options: Array
  },
  computed: {
    match_dateComputed: {
      get: function () {
        return this.date;
      },
      set: function (newValue) {
        this.$emit("update:match_date", newValue);
      }
    },
    match_timeComputed: {
      get: function () {
        return this.time;
      },
      set: function (newValue) {
        this.$emit("update:match_time", newValue);
      }
    },
    opponentComputed: {
      get: function () {
        return this.opponent;
      },
      set: function (newValue) {
        this.$emit("update:opponent", newValue);
      }
    }
  }
};
</script>

<style scoped>

</style>