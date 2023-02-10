import { createRouter, createWebHistory } from '@ionic/vue-router';
import { RouteRecordRaw } from 'vue-router';
import Tabs from '../views/Tabs.vue';
import Login from '../views/Login.vue';
import Children from '../views/Children.vue';
import UserOverview from '../views/HomePage.vue';
import Settings from '../views/SettingsPage.vue';
import EditChildren from '../views/EditChildren.vue';
import ChildDetail from '../views/ChildDetail.vue';

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    redirect: '/tabs/children',
  },
  {
    path: '/tabs/',
    component: Tabs,
    children: [
      {
        path: '',
        redirect: '/tabs/children',
      },
      {
        path: 'blog',
        component: () => import('@/views/HomePage.vue'),
      },
      {
        path: 'children',
        component: () => import('@/views/Children.vue'),
      },
      {
        path: 'children/:id',
        component: () => import('@/views/ChildDetail.vue'),
      },
      {
        path: 'settings',
        component: () => import('@/views/SettingsPage.vue'),
      },
      {
        path: 'editobservation',
        component: () => import('@/views/EditObservation.vue'),
      },
      {
        path: 'editchildren',
        component: () => import('@/views/EditChildren.vue'),
      },
    ],
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
