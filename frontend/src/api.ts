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
    return apiClient.delete(`survivors/${index}`);
  },
};
