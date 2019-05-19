import Vue from "vue";
import VueRouter from "vue-router";
import router from "../routes";
import App from "../App";

Vue.use(VueRouter);

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#application",
    router,
    render: h => h(App)
  });
});
