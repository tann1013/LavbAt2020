import Vue from 'vue';
import Router from 'vue-router';
import {
  constantRouterMap
} from '@/config/router.config';

Vue.use(Router);

export default new Router({
  mode: 'hash',//hash,解决刷新后端报错问题， history
  routes: constantRouterMap
});