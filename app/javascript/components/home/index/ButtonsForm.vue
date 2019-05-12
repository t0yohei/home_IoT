<template>
  <div class="container-fluid col-sm-6">
    <co2-buttons></co2-buttons>
    <weather-forecast-buttons></weather-forecast-buttons>
    <air-controll-buttons></air-controll-buttons>
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

<script>
import Co2Buttons from "./Co2Buttons";
import WeatherForecastButtons from "./WeatherForecastButtons";
import AirControllButtons from "./AirControllButtons";

export default {
  components: {
    "co2-buttons": Co2Buttons,
    "weather-forecast-buttons": WeatherForecastButtons,
    "air-controll-buttons": AirControllButtons
  }
};
</script>
