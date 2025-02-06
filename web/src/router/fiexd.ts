import Web from "@/layouts/Web.vue";
import { RouteRecordRaw } from "vue-router";

export const routes: RouteRecordRaw[] = [
  {
    path: "/",
    name: "root",
    redirect: "/web",
    children: [
      {
        path: "/web",
        name: "web",
        component: Web,
        redirect: "/home",
        children: [
          {
            path: "/home",
            name: "home",
            component: () => import("../views/web/index.vue"),
          },
          {
            path: "/search",
            name: "search",
            component: () => import("../views/web/search/index.vue"),
          },
          {
            path: "/product/:id",
            name: "product",
            component: () => import("../views/web/product/index.vue"),
          },
          {
            path: "/order/:id",
            name: "order",
            component: () => import("../views/web/order/index.vue"),
          },
          {
            path: "/comment/:id",
            name: "comment",
            component: () => import("../views/web/comment/index.vue"),
          },
          {
            path: "/problem/:id",
            name: "problem",
            component: () => import("../views/web/problem/index.vue"),
          },
          {
            path: "/user/:id",
            name: "user",
            component: () => import("../views/web/user/index.vue"),
          },
          {
            path: "/trolley",
            name: "trolley",
            component: () => import("../views/web/trolley/index.vue"),
          },
          {
            path: "/settings",
            name: "settings",
            component: () => import("../views/web/settings/index.vue"),
          },
          {
            path: "/test",
            name: "test",
            component: () => import("../views/web/test/index.vue"),
          },
        ],
      },
    ],
  },
  {
    path: "/login",
    name: "login",
    component: () => import("../views/sign/login/index.vue"),
  },
  {
    path: "/register",
    name: "register",
    component: () => import("../views/sign/register/index.vue"),
  },
  {
    path: "/:pathMatch(.*)*",
    name: "NotFound",
    component: () => import("../views/web/error/404/index.vue"),
  },
];
