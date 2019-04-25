<template>
  <div>
    <div class="container-fluid text-center">
      <h2>お家のIoT</h2>
    </div>

    <div class="container-fluid">
      <div class="container-fluid col-sm-6">
        <div class="container-fluid">
          <div class="row bg-success switches">
            <h3>CO2濃度取得</h3>
            <button
              v-on:click="getCo2Density"
              class="btn btn-success"
            >取得
            </button>
          </div>
        </div>

        <div class="container-fluid">
          <div class="row bg-info switches">
            <h3>天気予報アプリの起動</h3>
            <div>
              <button
                v-on:click="turnOnWeatherForecast"
                class="btn btn-info"
              >天気予報on
              </button>
              <button
                v-on:click="turnOffWeatherForecast"
                class="btn btn-info"
              >天気予報off
              </button>
            </div>
          </div>
        </div>

        <div class="container-fluid">
          <div class="row bg-warning switches">
          <h3>エアコンのリモコン</h3>
          <div>
            <button
              v-on:click="turnOnCool"
              class="btn btn-warning"
            >冷房
            </button>
            <button
              v-on:click="turnOnWarm"
              class="btn btn-warning"
            >暖房
            </button>
            <button
              v-on:click="turnOnDry"
              class="btn btn-warning"
            >除湿
            </button>
          </div>
          <button
            v-on:click="turnOffAirControll"
            class="btn btn-danger"
          >エアコン停止
          </button>
          </div>
        </div>
      </div>

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
                <td>n%</td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="row bg-danger right-row">
          <h3 class="text-center">操作履歴</h3>
          <table align="center" class="table table-bordered control-log">
            <tbody>
              <tr class="active">
                <td>logMessage</td>
              </tr>
            </tbody>
          </table>
        </div>
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
.control-log {
  overflow-y:scroll;
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

<script>
export default {
  data: function () {
    return {
      co2: {
        time: '',
        density: ''
      },
    }
  },
  methods: {
    getCo2Density(){
      console.log('co2');
    },
    turnOnWeatherForecast(){
      console.log('天気予報on');
    },
    turnOffWeatherForecast(){
      console.log('天気予報off');
    },
    turnOnCool() {
      console.log('冷房on');
    },
    turnOnWarm() {
      console.log('暖房on');
    },
    turnOnDry() {
      console.log('除湿on');
    },
    turnOffAirControll() {
      console.log('エアコン停止');
    },
  }
};
</script>
