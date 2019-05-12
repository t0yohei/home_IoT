<template>
  <div class="container-fluid">
    <div class="row bg-success switches">
      <h3>CO2濃度取得</h3>
      <button v-on:click="getCo2Density" class="btn btn-success">取得</button>
    </div>
  </div>
</template>

<style scoped>
.btn {
  margin: 10px;
  padding: 7px 13pt;
}
.switches {
  margin: 10px;
  text-align: center;
}
</style>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  methods: {
    getCo2Density(): void {
      console.log("co2");
    }
  }
});
</script>
