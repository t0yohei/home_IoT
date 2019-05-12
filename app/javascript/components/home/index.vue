<template>
  <div>
    <index-header></index-header>
    <div class="container-fluid">
      <index-buttons-form></index-buttons-form>
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

<script>
import Header from "./index/Header";
import ButtonsForm from "./index/ButtonsForm";

export default {
  components: {
    "index-header": Header,
    "index-buttons-form": ButtonsForm
  },

  data: function() {
    return {
      co2: {
        time: "",
        density: ""
      }
    };
  }
};
</script>
