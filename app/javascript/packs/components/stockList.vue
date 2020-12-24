<template>
  <div class="stockList">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>席種</th>
          <th>金額</th>
          <th>残り座席数</th>
        </tr>
        <tr v-for="stock in stocks" :key="stock.id">
          <td class="stockId">{{ stock.id }}</td>
          <td class="stockGrade">{{ stock.grade}}</td>
          <td class="stockPrice">{{ stock.price }}</td>
          <td class="stockRemain">{{ stock.remain }}</td>
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
      stocks: []
    }
  },
  mounted() {
    axios
      .get('/api/v1/stocks.json')
      .then(response => (this.stocks = response.data))
  }
}
</script>

<style scoped>
.stockList{
  width: 500px;
  padding: 30px;
}

.stockId{
  width: 10%;
}

.stockGrade{
  width: 20%;
}

.stockPrice{
  width: 30%;
}
</style>
