<template>
  <div>
    <index-header :title="title"></index-header>
    <div class="container-fluid">
      <index-buttons-form
        @get-co2-density="getCo2Density"
        @change-forecast-active-flag-condition="changeForecastActiveFlagCondition"
        @air-control-operated="airControlOperated"
      ></index-buttons-form>
      <div class="container-fluid col-sm-6">
        <index-fetched-data :co2-result="co2Result" />
        <index-operated-history :result-histroy="resultHistroy" />
      </div>
    </div>
  </div>
</template>

<style scoped>
</style>

<script lang="ts">
import Vue from "vue";
import axios from "axios";
import Header from "components/Header.vue";
import ButtonsForm from "./index/ButtonsForm.vue";
import FetchedData from "./index/FetchedData.vue";
import OperatedHistory from "./index/OperatedHistory.vue";
import Co2Result from "libs/Co2Result.ts"

// 二酸化炭素濃度Json取得のURL
const GET_CO2_URL = "/api/v1/home/get_co2_density";

export default Vue.extend({
  components: {
    "index-header": Header,
    "index-buttons-form": ButtonsForm,
    "index-fetched-data": FetchedData,
    "index-operated-history": OperatedHistory
  },

  data() {
    return {
      title: "お家のIoT",
      co2Result: Co2Result.buildDefault(),
      forecastResult: {
        succeded: "",
        message: "",
        time: ""
      },
      airControlResult: {
        succeded: "",
        message: "",
        time: ""
      },
      resultHistroy: []
    };
  },

  methods: {
    getCo2Density(): void {
      axios.get(GET_CO2_URL).then(response => {
        this.co2Result = Co2Result.build(response.data);
        this.resultHistroy.unshift(this.co2Result);
      });
    },
    changeForecastActiveFlagCondition(responseData: object): void {
      this.forecastResult = responseData;
      let now = new Date();
      this.forecastResult.time = now.toLocaleTimeString();
      this.resultHistroy.unshift(this.forecastResult);
    },
    airControlOperated(responseData: object): void {
      this.airControlResult = responseData;
      let now = new Date();
      this.forecastResult.time = now.toLocaleTimeString();
      this.resultHistroy.unshift(this.airControlResult);
    }
  }
});
</script>
