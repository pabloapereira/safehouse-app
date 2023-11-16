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
    <Button @click.prevent="getData" />
  </form>
</template>
