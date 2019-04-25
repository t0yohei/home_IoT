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
        <div class="container-fluid bg-danger">
          <div class="h3 text-center">取得データ</div>
          <div class="container-fluid">
            <table class="table table-bordered">
              <thead>
                <tr class="active">
                  <th>項目名称</th>
                  <th>数値</th>
                </tr>
              </thead>
              <tbody>
                <tr class="active">
                  <td>CO2濃度</td>
                </tr>
                <br>
              </tbody>
            </table>
          </div>
        </div>
        <br>
        <div class="container-fluid bg-danger">
          <div class="row">
            <div class="h3 text-center">操作履歴</div>
            <div class="container-fluid">
              <div style="height:200px; width:500px; overflow-y:scroll;">
                <table class="table table-bordered">
                  <tbody></tbody>
                </table>
              </div>
              <br>
            </div>
          </div>
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
