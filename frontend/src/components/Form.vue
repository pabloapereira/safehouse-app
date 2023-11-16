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
  <div class="card w-96 bg-base-100 shadow-xl">
    <div class="card-body items-center text-center">
      <h2 class="card-title">Novo Sobrevivente</h2>
      <p>Quem ainda resta no mundo?</p>
      <form>
        <div class="inputs">
          <label for="name">Nome</label>
          <input type="text" placeholder="Nome" id="nome" />
        </div>
        <div class="inputs">
          <label for="age">Idade</label>
          <input type="number" placeholder="Idade" />
        </div>
        <div class="inputs">
          <label for="sex">Sexo</label>
          <select name="sexo" id="sexo">
            <option value="M">M</option>
            <option value="F">F</option>
          </select>
        </div>
        <div class="posicao">
          <h3>Ultima Posição</h3>
          <div class="inputs">
            <label for="longitude">Longitude</label>
            <input type="text" placeholder="52º 03 21 W" />
          </div>
          <div class="inputs">
            <label for="latitude">Latitude</label>
            <input type="text" placeholder=" 25º 34 20 S" />
          </div>
        </div>
        <div class="inputs">
          <textarea name="inventario" id="itens" cols="30" rows="5"></textarea>
        </div>
      </form>
      <div class="card-actions">
        <Button @click.prevent="getData" />
      </div>
    </div>
  </div>
</template>
