<template>
  <main>
    <form>
      <div class="inputs">
        <label for="name">Nome</label>
        <input type="text" placeholder="Nome" id="nome">
      </div>
      <div class="inputs">
        <label for="age">Idade</label>
        <input type="number" placeholder="Idade">
      </div>
      <div class="inputs">
        <label for="sex">Sexo</label>
        <select name="sexo" id="sexo">
          <option value="M">M</option>
          <option value="F">F</option>
        </select>
      </div>
      <div class="inputs">
        <textarea name="inventario" id="itens" cols="30" rows="5"></textarea>
      </div>

      <Button />
    </form>
  </main>
</template>

<script>
import Button from './components/Button.vue'

export default {
  name: 'App',
  components: {
    Button
  }
}
</script>
<style>
  form{
    width: 20vw;
    height: 40vh;
    text-align: center;
    padding: 10%;
  }

  .inputs {
    margin-bottom: 4%;
  }
</style>