/*
 * @Author: zhongzihao 1184847189@qq.com
 * @Date: 2022-12-06 19:47:12
 * @LastEditors: zhongzihao 1184847189@qq.com
 * @LastEditTime: 2022-12-15 21:47:09
 * @Description: 注册微应用
 */
import store from '@/store';

import actions from './actions';

const MICRO_APPS = [
  {
    name: 'app-vue2',
    entry:
      process.env.NODE_ENV === 'production'
        ? '//localhost:9002' // 实际部署的地址
        : '//localhost:9002',
    activeRule: '/app/vue2',
  },
];

// 根据所配置权限，得到可注册的微应用及其路由结构
export const filterMicroApps = () => {
  const regMicroApps = MICRO_APPS.filter(app => {
    const appRoute = store.getters.appRoutes.find(r => r.remark === app.name);
    if (appRoute?.remark === app.name) {
      app.routes = appRoute;
      return true;
    }
    return false;
  });

  // console.log('所有微应用 microApps', microApps);
  // console.log('可注册微应用 regMicroApps', regMicroApps);
  // console.log('所有应用路由 appRoutes', store.getters.appRoutes);

  return regMicroApps.map(app => {
    return {
      name: app.name,
      entry: app.entry,
      activeRule: app.activeRule,
      container: '#subapp-viewport',
      props: {
        routerBase: app.activeRule,
        routes: app.routes,
        permissions: store.getters.permissions,
        roles: store.getters.roles,
        store: actions.getGlobalState(),
      },
    };
  });
};

const green = '#41b883';
const black = '#35495e';
const red = '#c23531';
const print = (
  label = process.env.VUE_APP_TITLE,
  value,
  labeelColor = black,
  valueColor = green,
) =>
  console.log(
    `%c ${label} %c ${value} %c`,
    `background:${labeelColor} ; padding: 1px; border-radius: 3px 0 0 3px; color: #fff`,
    `background:${valueColor} ; padding: 1px; border-radius: 0 3px 3px 0; color: #fff`,
    'background:transparent;',
  );
// 生命周期钩子
export const microAppHooks = {
  beforeLoad: [
    app => {
      print(app.name, '[beforeLoad]', black, green);
      return Promise.resolve();
    },
  ],
  beforeMount: [
    app => {
      print(app.name, '[beforeMount]', black, green);
      return Promise.resolve();
    },
  ],
  beforeUnmount: [
    app => {
      print(app.name, '[beforeUnmount]', black, red);
      return Promise.resolve();
    },
  ],
  afterUnmount: [
    app => {
      print(app.name, '[afterUnmount]', black, red);
      return Promise.resolve();
    },
  ],
};
