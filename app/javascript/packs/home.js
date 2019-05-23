// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'

// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })

import Vue from "vue";
import VueRouter from "vue-router";
import Index from "../components/home/Index";

document.addEventListener("DOMContentLoaded", () => {
  const el = "#homeIndex";
  const app = new Vue({
    el,
    render: h => h(Index)
  });
});
