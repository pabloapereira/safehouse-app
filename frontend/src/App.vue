<script setup lang="ts">
import Form from './components/Form.vue';
import List from './components/List.vue';
import { ref, onMounted } from 'vue';

const listRef = ref(null);

const updateList = (formData: Object) => {
  listRef.value!.getSurvivors();
  return formData;
};

onMounted(() => {
  listRef.value!.getSurvivors();
});
</script>

<template>
  <main>
    <div class="flex flex-col h-4/5 lg:flex-row my-12">
      <div
        class="grid flex-auto card rounded-box place-items-center content-start"
      >
        <Form @form-data="updateList" />
      </div>
      <div
        class="divider divider-error lg:divider-horizontal mix-blend-color"
      ></div>
      <div class="grid flex-grow card rounded-box place-items-center">
        <List ref="listRef" />
      </div>
    </div>
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

h3 {
  color: #110102;
}

label {
  color: #110102;
}
</style>
