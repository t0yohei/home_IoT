<template>
  <div class="row bg-danger right-row">
    <h3 class="text-center">取得データ</h3>
    <table align="center" class="table table-bordered fetched-data">
      <thead>
        <tr class="active">
          <th>項目名称</th>
          <th>数値</th>
        </tr>
      </thead>
      <tbody>
        <tr class="active">
          <td>CO2濃度</td>
          <td>{{ co2Result.co2 }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<style scoped>
.fetched-data {
  width: 90%;
}
</style>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  props: {
    co2Result: {
      type: Object,
      default: {}
    }
  }
});
</script>
