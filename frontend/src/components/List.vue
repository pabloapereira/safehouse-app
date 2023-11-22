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
        const response = await api.getSurvivors();
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
    showEditField(index: number) {
      const form = document.getElementById('edit-form-' + index);
      if (form?.classList.contains('hidden')) {
        form?.classList.remove('hidden');
        return;
      }
      form?.classList.add('hidden');
    },
    async updateLocation(
      survivorId: string,
      locationId: string,
      latitude: string,
      longitude: string,
      formIndex: number
    ) {
      console.log('Trying to update location');
      const newLocation = {
        latitude: latitude,
        longitude: longitude,
        survivor_id: survivorId,
      };

      const jsonLocation = JSON.stringify(newLocation);
      try {
        await api.updateLocation(survivorId, locationId, jsonLocation);
        console.log('Location updated!');
        const form = document.getElementById('edit-form-' + formIndex);
        form?.classList.add('hidden');
      } catch (error) {
        console.error('Error updating location:', error);
      }

      return;
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
              <th class="text-black">Name</th>
              <th class="text-black">Location</th>
              <th class="text-black">Is Alive?</th>
              <th></th>
            </tr>
          </thead>
          <tbody v-for="(survivor, index) in survivors" :key="index">
            <tr>
              <th>
                <button class="btn px-[0.75rem]" @click="showEditField(index)">
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
                </button>
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
                <span class="badge badge-ghost badge-sm">
                  {{ survivor.latitude }}
                </span>
                <br />
                <span class="badge badge-ghost badge-sm">{{
                  survivor.longitude
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
            <tr class="hidden" :id="'edit-form-' + index">
              <td colspan="2">
                <input
                  type="text"
                  placeholder="Latitude"
                  class="input input-bordered w-full max-w-xs text-white"
                  v-model="survivor.latitude"
                />
              </td>
              <td colspan="2">
                <input
                  type="text"
                  placeholder="Longitude"
                  class="input input-bordered w-full max-w-xs text-white"
                  v-model="survivor.longitude"
                />
              </td>
              <td colspan="1">
                <button
                  class="btn"
                  @click="
                    updateLocation(
                      survivor.id,
                      survivor.location_id,
                      survivor.latitude,
                      survivor.longitude,
                      index
                    )
                  "
                >
                  Send
                </button>
              </td>
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
