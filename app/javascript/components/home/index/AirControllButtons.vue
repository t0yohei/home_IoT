<template>
  <div class="container-fluid">
    <div class="row bg-warning switches">
      <h3>エアコンのリモコン</h3>
      <div>
        <button
          v-for="startOption in startOptions"
          :key="startOption.id"
          @click="startControl(startOption.command)"
          class="btn btn-warning"
        >{{ startOption.name }}</button>
      </div>
      <button @click="stopControll(stopOption.command)" class="btn btn-danger">{{ stopOption.name }}</button>
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
  data() {
    return {
      startOptions: [
        {
          id: 1,
          name: "冷房",
          command: "cool_on"
        },
        {
          id: 2,
          name: "暖房",
          command: "hot_on"
        },
        {
          id: 3,
          name: "除湿",
          command: "dry_on"
        }
      ],
      stopOption: {
        name: "エアコン停止",
        command: "air_off"
      }
    };
  },

  methods: {
    startControl(command: string): void {
      console.log(command);
    },
    stopControll(command: string): void {
      console.log(command);
    }
  }
});
</script>
