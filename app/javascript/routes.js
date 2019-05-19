import VueRouter from "vue-router";
import Index from "./components/home/Index";
const routes = [
  {
    path: "/",
    component: Index
  }
];

export default new VueRouter({ routes });
