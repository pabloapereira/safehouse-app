<script lang="ts">
import api from "../api";

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
        const response = await api.getSurvivors();
        this.survivors = response.data;
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    },
    async deleteSurvivor(id: string) {
      try {
        await api.deleteSurvivor(id);
        this.getSurvivors();
      } catch (error) {
        console.error("Error deleting survivor:", error);
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
                <label>
                  <input type="checkbox" class="checkbox" />
                </label>
              </th>
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
                Unknown
                <br />
                <span class="badge badge-ghost badge-sm">Missing</span>
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
