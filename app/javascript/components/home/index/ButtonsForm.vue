<template>
  <div class="container-fluid col-sm-6">
    <co2-buttons @get-co2-density="getCo2Density"/>
    <weather-forecast-buttons
      @change-forecast-active-flag-condition="changeForecastActiveFlagCondition"
    />
    <air-controll-buttons @air-control-operated="airControlOperated"/>
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
import Co2Buttons from "./Co2Buttons.vue";
import WeatherForecastButtons from "./WeatherForecastButtons.vue";
import AirControllButtons from "./AirControllButtons.vue";

export default Vue.extend({
  components: {
    "co2-buttons": Co2Buttons,
    "weather-forecast-buttons": WeatherForecastButtons,
    "air-controll-buttons": AirControllButtons
  },
  methods: {
    getCo2Density(): void {
      this.$emit("get-co2-density");
    },
    changeForecastActiveFlagCondition(responseData: object): void {
      this.$emit("change-forecast-active-flag-condition", responseData);
    },
    airControlOperated(responseData: object): void {
      this.$emit("air-control-operated", responseData);
    }
  }
});
</script>
