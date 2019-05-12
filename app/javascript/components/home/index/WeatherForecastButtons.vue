<template>
  <div class="container-fluid">
    <div class="row bg-info switches">
      <h3>天気予報アプリの起動</h3>
      <div>
        <button v-on:click="turnOnWeatherForecast" class="btn btn-info">天気予報on</button>
        <button v-on:click="turnOffWeatherForecast" class="btn btn-info">天気予報off</button>
      </div>
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
    turnOnWeatherForecast(): void {
      console.log("天気予報on");
    },
    turnOffWeatherForecast(): void {
      console.log("天気予報off");
    }
  }
});
</script>
