<template>
  <main>
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
      <Button @click="getData" />
    </form>
  </main>
</template>

<script>
import Button from './components/Button.vue';
import api from './api.ts';

export default {
  name: 'App',
  components: {
    Button,
  },
  methods: {
    async getData(event) {
      event.preventDefault();
      try {
        const response = await api.getData();
        console.log(response.data); // Handle the response data as needed
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    },
  },
};
</script>
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
