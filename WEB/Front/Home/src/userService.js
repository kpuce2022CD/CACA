import axios from "axios";

const USER_API_BASE_URL = "http://localhost:8085/user"; 

class userService {
    getUser() {
        return axios.get(USER_API_BASE_URL);
    }

    updateEmail(user_email){
        return axios.put(USER_API_BASE_URL+'/'+user_email);
    }

    updateAbout(user_about){
        return axios.put(USER_API_BASE_URL+'/'+user_about);
    }
}
export default new userService();
