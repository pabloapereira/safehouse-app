import axios from 'axios';

const apiClient = axios.create({
  baseURL: 'http://localhost:3000/',
  headers: {
    'Content-Type': 'application/json',
  },
});

export default {
  // Example function to get data from the API
  getData() {
    return apiClient.get('/survivors');
  },

  // Example function to post data to the API
  postData(data: JSON) {
    return apiClient.post('/survivors', data);
  },
};
