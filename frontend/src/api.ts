import axios from 'axios';

const apiClient = axios.create({
  baseURL: 'http://localhost:3000/',
  headers: {
    'Content-Type': 'application/json',
  },
});

export default {
  getSurvivors() {
    return apiClient.get('/survivors');
  },

  postSurvivor(data: Object) {
    return apiClient.post('/survivors', data);
  },

  deleteSurvivor(index: string) {
    const id = {
      id: index,
    };
    const survivor_id = JSON.stringify(id);
    return apiClient.put(`survivors/${index}/archive`, survivor_id);
  },

  updateLocation(
    survivor_id: string,
    location_id: string,
    newLocation: string
  ) {
    return apiClient.put(
      `/survivors/${survivor_id}/locations/${location_id}`,
      newLocation
    );
  },
};
