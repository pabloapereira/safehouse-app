<script setup lang="ts">
import Form from './components/Form.vue';
</script>

<template>
  <main>
    <Form></Form>
  </main>
</template>

<style>
@import url('https://fonts.googleapis.com/css2?family=Island+Moments&family=Montserrat:ital,wght@1,300&family=Nothing+You+Could+Do&family=Noto+Sans:wght@400;700&family=Palanquin+Dark:wght@400;500;600&display=swap');
main {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}

form {
  text-align: center;
  width: 20%;
  padding: 10%;
  background-repeat: no-repeat;
  background-size: cover;
}

.inputs {
  margin-bottom: 4%;
}

.inputs input {
  margin-bottom: 4%;
}

h3 {
  color: #110102;
}

label {
  color: #110102;
}
</style>
