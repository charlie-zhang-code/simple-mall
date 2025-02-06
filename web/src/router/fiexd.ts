import Web from "@/layouts/Web.vue";
import { RouteRecordRaw } from "vue-router";

export const routes: RouteRecordRaw[] = [
    {
        path: '/',
        name: 'root',
        redirect: '/web',
        children: [
            {
                path: '/web',
                name: 'web',
                component: Web,
                redirect: '/home',
                children: [
                    {
                        path: '/home',
                        name: 'home',
                        component: () => import('../views/web/index.vue')
                    },
                    {
                        path: '/search',
                        name: 'search',
                        component: () => import('../views/web/search/index.vue')
                    },
                    {
                        path: '/product',
                        name: 'product',
                        component: () => import('../views/web/product/index.vue')
                    },
                    {
                        path: '/order',
                        name: 'order',
                        component: () => import('../views/web/order/index.vue')
                    },
                    {
                        path: '/test',
                        name: 'test',
                        component: () => import('../views/web/test/index.vue')
                    }
                ]
            }
        ]
    }
]