<script lang="ts">
import Button from './Button.vue';
import api from '../api';

export default {
  components: {
    Button,
  },
  methods: {
    async getData() {
      console.log('Clicked!');
      try {
        const response = await api.getData();
        console.log(response.data);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    },
  },
};
</script>

<template>
  <div
    class="card w-96 shadow-xl bg-gradient-to-t from-red-800 from-20% to-transparent to-90%"
  >
    <div class="card-body items-center text-center">
      <h2 class="card-title">Novo Sobrevivente</h2>
      <p>Quem ainda resta no mundo?</p>
      <form class="mb-5">
        <div class="form-control w-full max-w-xs">
          <label class="label">
            <span class="label-text">Nome</span>
          </label>
          <input
            type="text"
            placeholder="Rick Grimes"
            class="input input-bordered w-full max-w-xs"
            id="name"
          />
        </div>

        <div class="form-control w-full max-w-xs">
          <label class="label">
            <span class="label-text">Idade</span>
          </label>
          <input
            type="number"
            min="1"
            max="120"
            placeholder="30"
            class="input input-bordered w-full max-w-xs"
            id="age"
          />
        </div>

        <div class="form-control w-full max-w-xs">
          <label class="label">
            <span class="label-text">Sexo</span>
          </label>
          <select class="select select-bordered mb-4" id="gender">
            <option disabled selected>Gênero</option>
            <option>Feminino</option>
            <option>Masculino</option>
          </select>
        </div>

        <p class="font-semibold">Ultima Posição</p>

        <div class="form-control w-full max-w-xs">
          <label class="label">
            <span class="label-text">Longitude</span>
          </label>
          <input
            type="number"
            min="-180.000000"
            max="180.000000"
            step="0.000001"
            placeholder="0.000000"
            class="input input-bordered w-full max-w-xs"
            id="longitude"
          />
        </div>

        <div class="form-control w-full max-w-xs">
          <label class="label">
            <span class="label-text">Latitude</span>
          </label>
          <input
            type="number"
            min="-90.000000"
            max="90.000000"
            step="0.000001"
            placeholder="0.000000"
            class="input input-bordered w-full max-w-xs"
            id="longitude"
          />
        </div>

        <!-- Inventory will go here in future updates -->
        <!-- <div class="inputs">
          <textarea name="inventario" id="itens" cols="30" rows="5"></textarea>
        </div> -->
      </form>
      <div class="card-actions">
        <Button @click.prevent="getData" />
      </div>
    </div>
  </div>
</template>
