<template>
<li class="stockDetails">
  <div class="stockGrade">{{ stock.grade }}</div>
  <div class="stockPrice">{{ stock.price }}</div>
  <div class="stockRemain">{{ stock.remain }}</div>
</li>
</template>

<script>
export default {
  props: ["stock"]
}
</script>

<style scoped>

.stockDetails{
  height: 50px;
  display: flex;
  margin-bottom: 10px;
  line-height: 50px;
}
.stockGrade{
  width: 100px;
}
.stockPrice{
  width: 100px;
}
.stockRemain{
  width: 100px;

}

</style>