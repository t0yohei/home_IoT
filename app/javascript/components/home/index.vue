<template>
  <div>
    <index-header></index-header>
    <div class="container-fluid">
      <index-buttons-form
        @get-co2-density="getCo2Density"
        @change-forecast-active-flag-condition="changeForecastActiveFlagCondition"
      ></index-buttons-form>
      <div class="container-fluid col-sm-6">
        <div class="row bg-danger right-row">
          <h3 class="text-center">取得データ</h3>
          <table align="center" class="table table-bordered acquired-data">
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
      </div>
    </div>
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
.acquired-data {
  width: 90%;
}
</style>

<script lang="ts">
import Vue from "vue";
import axios from "axios";
import Header from "./index/Header.vue";
import ButtonsForm from "./index/ButtonsForm.vue";

// 二酸化炭素濃度Json取得のURL
const GET_CO2_URL = "/api/v1/home/get_co2_density";

export default Vue.extend({
  components: {
    "index-header": Header,
    "index-buttons-form": ButtonsForm
  },

  data() {
    return {
      co2Result: {
        co2: "",
        message: "",
        time: ""
      },
      forecastResult: {
        succeded: "",
        message: "",
        time: ""
      },
      resultHistroy: []
    };
  },

  mounted() {
    this.getCo2Density();
  },

  methods: {
    getCo2Density(): void {
      axios.get(GET_CO2_URL).then(response => {
        this.co2Result = response.data;
        let now = new Date();
        this.co2Result.time = now.toLocaleTimeString();
        this.resultHistroy.push(this.co2Result);
      });
    },
    changeForecastActiveFlagCondition(responseData: object): void {
      this.forecastResult = responseData;
      let now = new Date();
      this.forecastResult.time = now.toLocaleTimeString();
      this.resultHistroy.push(this.forecastResult);
    }
  }
});
</script>
