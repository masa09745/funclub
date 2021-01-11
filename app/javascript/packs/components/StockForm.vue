<template>
  <b-form class="stockForm">
    <div>
      <b-form-group label="席種">
        <b-form-select>
          <template v-for="(option, index) in options">
            <option :value="option.value" :key="index">{{option.label}}</option>
          </template>
        </b-form-select>
      </b-form-group>
      <b-form-group label="金額">
        <b-form-input></b-form-input>
      </b-form-group>
      <b-form-group label="在庫量">
        <b-form-input></b-form-input>
      </b-form-group>
    </div>
    <b-button variant="primary">作成</b-button>
  </b-form>
</template>

<script>
export default {
  data() {
    return{
      options: [{label:"S", value:"S"},{label:"A", value:"A"},{label:"B", value:"B"},{label:"C", value:"C"}]
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