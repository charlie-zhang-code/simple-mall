import Web from "@/layouts/Web.vue";
import { RouteRecordRaw } from "vue-router";

export const routes: RouteRecordRaw[] = [
    {
        path: '/',
        name: 'webroot',
        redirect: '/root',
        children: [
            {
                path: '/root',
                name: 'root',
                component: Web,
                redirect: '/home',
                children: [
                    {
                        path: '/home',
                        name: 'home',
                        component: () => import('../views/web/index.vue')
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