<template>
  <div class="container-fluid">
    <div class="row bg-warning switches">
      <h3>エアコンのリモコン</h3>
      <div>
        <button
          v-for="startOption in startOptions"
          :key="startOption.id"
          @click="operateControl(startOption.command)"
          class="btn btn-warning"
        >{{ startOption.name }}</button>
      </div>
      <button
        @click="operateControl(stopOption.command)"
        class="btn btn-danger"
      >{{ stopOption.name }}</button>
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
import axios from "axios";

// エアコン操作機能操作のURL
const POST_OPERATE_AIR_CONTROL_URL = "/api/v1/home/operate_air_controll";

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
    operateControl(command: string): void {
      axios
        .post(POST_OPERATE_AIR_CONTROL_URL, {
          air_controll_operation_command: command
        })
        .then(response => this.$emit("air-control-operated", response.data))
        .catch(error => console.log(error));
    }
  }
});
</script>
