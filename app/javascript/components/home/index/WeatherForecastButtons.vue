<template>
  <div class="container-fluid">
    <div class="row bg-info switches">
      <h3>天気予報アプリの起動</h3>
      <div>
        <toggle-button
          v-model="forecastActiveFlag"
          @change="changeForecastActiveFlagCondition"
          color="#82C7EB"
          :sync="true"
          :labels="{checked: 'On', unchecked: 'Off'}"
        />
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
import { ToggleButton } from "vue-js-toggle-button";
import axios from "axios";

// 天気予報機能操作のURL
const POST_OPERATE_FORECAST_SWITCH_URL = "/api/v1/home/operate_forecast_switch";

export default Vue.extend({
  components: {
    "toggle-button": ToggleButton
  },

  data() {
    return {
      forecastActiveFlag: false
    };
  },

  methods: {
    changeForecastActiveFlagCondition(): void {
      axios
        .post(POST_OPERATE_FORECAST_SWITCH_URL, {
          forecast_active_flag: this.forecastActiveFlag
        })
        .then(response =>
          this.$emit("change-forecast-active-flag-condition", response.data)
        )
        .catch(error => console.log(error));
    }
  }
});
</script>
