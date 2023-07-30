/*
 * @Author: zhongzihao 1184847189@qq.com
 * @Date: 2022-12-08 20:56:05
 * @LastEditors: zhongzihao 1184847189@qq.com
 * @LastEditTime: 2022-12-15 21:42:51
 * @Description: Do not edit
 */
import Vue from 'vue';
import { initGlobalState } from 'qiankun';

import store from '@/store';

// 全局数据
export const initialState = Vue.observable({
  token: null,
  $route: null,
});
const actions = initGlobalState(initialState);

actions.onGlobalStateChange((state, prevstate) => {
  // console.log('父应用改变数据', state, prevstate);
  for (const key in state) {
    if (Object.prototype.hasOwnProperty.call(state, key)) {
      initialState[key] =  state[key];
      if (key === '$route') {
        store.commit('SET_CHILD_ROUTE', state[key]);
        continue;
      }
    }
  }
});

actions.getGlobalState = key => {
  return key ? initialState[key] : initialState;
};

export default actions;
