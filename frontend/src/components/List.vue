<script lang="ts">
import api from '../api';

export default {
  data() {
    return {
      survivors: [],
    };
  },
  created() {
    this.getSurvivors();
  },
  methods: {
    async getSurvivors() {
      try {
        const response = await api.getFullSurvivor('1');
        this.survivors = response.data;
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    },
    async deleteSurvivor(id: string) {
      try {
        await api.deleteSurvivor(id);
        this.getSurvivors();
      } catch (error) {
        console.error('Error deleting survivor:', error);
      }
    },
  },
  props: {
    data: {
      type: Array,
    },
  },
};
</script>

<template>
  <div
    class="card shadow-xl bg-gradient-to-t from-red-800 from-45% to-transparent to-95% text-black"
  >
    <div class="card-body items-center text-center">
      <h2 class="card-title">Sobreviventes</h2>
      <p>Aqui estão aqueles que vivem... Por enquanto</p>
      <div class="overflow-x-auto">
        <table class="table">
          <!-- head -->
          <thead>
            <tr>
              <th class="text-black">Edit</th>
              <th>
                <label>
                  <input type="checkbox" class="checkbox" />
                </label>
              </th>
              <th class="text-black">Name</th>
              <th class="text-black">Location</th>
              <th class="text-black">Is Alive?</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(survivor, index) in survivors" :key="index">
              <th>
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  class="w-6 h-6"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L6.832 19.82a4.5 4.5 0 01-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 011.13-1.897L16.863 4.487zm0 0L19.5 7.125"
                  />
                </svg>
              </th>
              <td>
                <label>
                  <input type="checkbox" class="checkbox checkbox-error" />
                </label>
              </td>
              <td>
                <div class="flex items-center gap-3">
                  <div class="avatar">
                    <div class="mask mask-squircle w-12 h-12">
                      <img
                        v-if="survivor.gender === 'Male'"
                        src="https://xsgames.co/randomusers/avatar.php?g=male"
                        alt="Avatar Tailwind CSS Component"
                      />
                      <img
                        v-if="survivor.gender === 'Female'"
                        src="https://xsgames.co/randomusers/avatar.php?g=female"
                        alt="Avatar Tailwind CSS Component"
                      />
                    </div>
                  </div>
                  <div>
                    <div class="font-bold">{{ survivor.name }}</div>
                    <div class="text-sm opacity-50">Russia</div>
                  </div>
                </div>
              </td>
              <td>
                <!-- {{ console.log(getLocation(survivor.id)) }} -->
                <!-- Idea to improve this part
                1 - App need to load every survivor
                2 - For every Survivor, get it's location
                3 - Store location inside Survivor[n]
                4 - Show it here simply as "survivor.longitude" -->
                {{ survivor.longitude }}
                <br />
                <span class="badge badge-ghost badge-sm">{{
                  survivor.latitude
                }}</span>
              </td>
              <td v-if="survivor.is_alive">Yes</td>
              <td v-else>No</td>
              <th>
                <button
                  class="btn btn-ghost btn-xs"
                  @click="deleteSurvivor(survivor.id)"
                >
                  Delete
                </button>
              </th>
            </tr>
          </tbody>
          <!-- foot -->
          <tfoot></tfoot>
        </table>
      </div>
      <div class="card-actions"></div>
    </div>
  </div>
</template>
