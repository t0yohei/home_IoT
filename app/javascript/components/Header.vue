<template>
  <div class="container-fluid text-center">
    <h2>{{title}}</h2>
  </div>
</template>

<style scoped></style>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  props: {
    title: {
      type: String,
      required: true
    }
  }
});
</script>
