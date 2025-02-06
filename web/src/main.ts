import { createApp } from "vue";
import "@/assets/style.css";
import App from "@/App.vue";
import { setupRouter } from "./router";
import { setupPinia } from "./stores";
import 'virtual:uno.css'

async function setupApp() {
  const app = createApp(App);

  // 引入Pinia
  await setupPinia(app);

  // 引入路由
  await setupRouter(app);

  // 挂载Vue
  app.mount("#app");
}

setupApp();
