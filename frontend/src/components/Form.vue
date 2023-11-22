<script lang="ts">
import Button from './CustomButton.vue';
import api from '../api';
// Refactor all of this to Vue 3
export default {
  components: {
    Button,
  },
  data() {
    return {
      formData: {
        name: '',
        age: null,
        gender: '',
        longitude: null,
        latitude: null,
        is_alive: true,
      },
    };
  },
  computed: {
    isFormValid() {
      return (
        this.formData.name && this.formData.age !== null && this.formData.gender
      );
    },
  },
  methods: {
    async sendData() {
      try {
        console.log(this.formData.longitude);
        const response = await api.postSurvivor(this.formData);
        this.$emit('form-data', this.formData);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    },
  },
};
</script>

<template>
  <div
    class="card w-96 shadow-xl bg-gradient-to-t from-red-800 from-20% to-transparent to-90% text-black"
  >
    <div class="card-body items-center text-center">
      <h2 class="card-title">Novo Sobrevivente</h2>
      <p>Quem ainda resta no mundo?</p>
      <form class="mb-5">
        <div class="form-control w-full max-w-xs">
          <label class="label">
            <span class="label-text text-gray-400">Nome</span>
          </label>
          <input
            type="text"
            placeholder="Rick Grimes"
            class="input input-bordered text-white w-full max-w-xs text-white"
            id="name"
            v-model="formData.name"
            required
          />
        </div>

        <div class="form-control w-full max-w-xs">
          <label class="label">
            <span class="label-text text-gray-400">Idade</span>
          </label>
          <input
            type="number"
            min="1"
            max="120"
            placeholder="30"
            class="input input-bordered text-white w-full max-w-xs"
            id="age"
            v-model="formData.age"
            required
          />
        </div>

        <div class="form-control w-full max-w-xs">
          <label class="label">
            <span class="label-text text-gray-400">Sexo</span>
          </label>
          <select
            class="select select-bordered text-white mb-4 text-gray-400"
            id="gender"
            v-model="formData.gender"
            required
          >
            <option disabled selected>Gênero</option>
            <option value="Female">Feminino</option>
            <option value="Male">Masculino</option>
          </select>
        </div>

        <p class="font-semibold">Ultima Posição</p>

        <div class="form-control w-full max-w-xs">
          <label class="label">
            <span class="label-text text-gray-400">Longitude</span>
          </label>
          <input
            type="number"
            min="-180.000000"
            max="180.000000"
            step="0.000001"
            placeholder="0.000000"
            class="input input-bordered text-white w-full max-w-xs"
            id="longitude"
            v-model="formData.longitude"
          />
        </div>

        <div class="form-control w-full max-w-xs">
          <label class="label">
            <span class="label-text text-gray-400">Latitude</span>
          </label>
          <input
            type="number"
            min="-90.000000"
            max="90.000000"
            step="0.000001"
            placeholder="0.000000"
            class="input input-bordered text-white w-full max-w-xs"
            id="latitude"
            v-model="formData.latitude"
          />
        </div>

        <!-- Inventory will go here in future updates -->
        <!-- <div class="inputs">
          <textarea name="inventario" id="itens" cols="30" rows="5"></textarea>
        </div> -->
      </form>
      <div class="card-actions">
        <Button
          @click.prevent="sendData"
          :disabled="!isFormValid"
          :style="{ opacity: isFormValid ? '1' : '0.5' }"
        />
      </div>
    </div>
  </div>
</template>
