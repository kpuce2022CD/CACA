import axios from "axios";

const USER_API_BASE_URL = "http://localhost:8081/api/about_customer1"; 

class aboutService {
    getUser() {
        return axios.get(USER_API_BASE_URL);
    }
}
export default new aboutService();

