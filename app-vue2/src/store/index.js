/*
 * @Author: zhongzihao 1184847189@qq.com
 * @Date: 2022-07-03 19:04:35
 * @LastEditors: zhongzihao 1184847189@qq.com
 * @LastEditTime: 2022-12-14 19:34:14
 * @Description: Do not edit
 */
import Vue from 'vue';
import Vuex from 'vuex';
import app from './modules/app';
import permission from './modules/permission';
import settings from './modules/settings';
import user from './modules/user';

import getters from './getters';

Vue.use(Vuex);

const store = new Vuex.Store({
  modules: {
    app,
    permission,
    settings,
    user,
  },
  getters,
});

export default store;
