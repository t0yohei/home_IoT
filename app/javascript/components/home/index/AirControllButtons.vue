<template>
  <div class="container-fluid">
    <div class="row bg-warning switches">
      <h3>エアコンのリモコン</h3>
      <div>
        <button v-on:click="turnOnCool" class="btn btn-warning">冷房</button>
        <button v-on:click="turnOnWarm" class="btn btn-warning">暖房</button>
        <button v-on:click="turnOnDry" class="btn btn-warning">除湿</button>
      </div>
      <button v-on:click="turnOffAirControll" class="btn btn-danger">エアコン停止</button>
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
    turnOnCool(): void {
      console.log("冷房on");
    },
    turnOnWarm(): void {
      console.log("暖房on");
    },
    turnOnDry(): void {
      console.log("除湿on");
    },
    turnOffAirControll(): void {
      console.log("エアコン停止");
    }
  }
});
</script>
