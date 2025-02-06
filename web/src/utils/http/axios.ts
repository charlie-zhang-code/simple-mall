import axios from "axios";
import type { AxiosRequestConfig, AxiosResponse, AxiosError } from "axios";

export const AXIOS = axios.create({
  baseURL: "http://localhost:8083",
});

// 请求拦截
AXIOS.interceptors.request.use(
  (config: AxiosRequestConfig): any => {
    const headers = config.headers || {};
    headers["Authorization"] = "xxx";
    config.headers = headers;
    return config;
  },
  (error: AxiosError) => {
    return Promise.reject(error);
  }
);

// 响应拦截器
AXIOS.interceptors.response.use(
  (response: AxiosResponse) => {
    return response;
  },
  (error: AxiosError) => {
    return Promise.reject(error);
  }
);

