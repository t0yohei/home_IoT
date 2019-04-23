<template>
  <div>
    <div class="container-fluid text-center">
      <h2>お家のIoT</h2>
      <br>
    </div>

    <div class="container-fluid">
      <div class="container-fluid col-sm-6">
        <div class="container-fluid">
          <div class="row text-center bg-success">
            <h3>CO2濃度取得</h3>
            <br>
          </div>
          <br>
        </div>

        <div class="container-fluid">
          <div class="row text-center bg-info">
            <h3>天気予報アプリの起動</h3>
            <div class="col-sm-3 col-sm-offset-2"></div>
            <div class="col-sm-3 col-sm-offset-2">
              <br>
            </div>
            <br>
          </div>
          <br>
        </div>

        <div class="ontainer-fluid bg-warning text-center">
          <div class="row">
            <h3>エアコンのリモコン</h3>
            <div class="col-sm-1 col-sm-offset-3"></div>

            <div class="col-sm-1 col-sm-offset-1"></div>

            <div class="col-sm-1 col-sm-offset-1"></div>
            <br>
          </div>
          <br>

          <div class="row"></div>
          <br>
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
</style>

<script>
export default {};
</script>
