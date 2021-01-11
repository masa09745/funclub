<template>
  <b-form class="stockForm">
    <div>
      <b-form-group label="席種">
        <b-form-select v-model="gradeComputed">
          <template v-for="(option, index) in options">
            <option :value="option.value" :key="index">{{option.label}}</option>
          </template>
        </b-form-select>
      </b-form-group>
      <b-form-group label="金額">
        <b-form-input v-model="priceComputed"></b-form-input>
      </b-form-group>
      <b-form-group label="在庫量">
        <b-form-input v-model="remainComputed"></b-form-input>
      </b-form-group>
      <div>{{schedule_id}}</div>
    </div>
    <b-button variant="primary" @click="$emit('submit')">作成</b-button>
  </b-form>
</template>

<script>
export default {
  props:{
    schedule_id: Number,
    grade: String,
    price: String,
    remain: String,
    options: Array,
  },

  computed: {
    gradeComputed: {
      get: function() {
        return this.data;
      },
      set: function(newValue){
        this.$emit("update:grade", newValue);
      }
    },
    priceComputed: {
      get: function() {
        return this.data;
      },
      set: function(newValue){
        this.$emit("update:price", newValue);
      }
    },
    remainComputed: {
      get: function() {
        return this.data;
      },
      set: function(newValue){
        this.$emit("update:remain", newValue);
      }
    }
  }
}
</script>

<style scoped>
.stockForm{
  width: 300px;
  padding: 0;
  margin: 10px auto 0;
}

</style>