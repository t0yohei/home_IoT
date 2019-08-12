<template>
  <div class="row bg-danger right-row">
    <h3 class="text-center">操作履歴</h3>
    <table align="center" class="table table-bordered control-log">
      <tbody>
        <tr class="active" v-for="result in resultHistroy" v-bind:key="result.time">
          <td>{{ result.message }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<style scoped>
.control-log {
  overflow-y: scroll;
  width: 90%;
}
.right-row {
  margin: 10px;
  text-align: center;
}
</style>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  props: {
    resultHistroy: {
      type: Array,
      default: []
    }
  }
});
</script>
