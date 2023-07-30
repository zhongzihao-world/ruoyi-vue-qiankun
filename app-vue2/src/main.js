import Vue from 'vue';
import VueRouter from 'vue-router';

import Cookies from 'js-cookie';

import Element from 'element-ui';
import './assets/styles/element-variables.scss';

import './assets/icons'; // icon
import '@/assets/styles/index.scss'; // global css
import '@/assets/styles/ruoyi.scss'; // ruoyi css

import App from './App';
import store from './store';
import { constantRoutes } from './router';
import { initRouter } from './router/initRouter';
import directive from './directive'; // directive

Vue.use(directive);
Vue.use(Element);

import actions from './actions';
import './public-path';

let instance = null;
let router = null;

function render(props = {}) {
  const { container, routerBase } = props;
  
  router = new VueRouter({
    base: window.__POWERED_BY_QIANKUN__ ? routerBase : '/',
    mode: 'history',
    routes: constantRoutes,
  });
  initRouter(props, router);

  Vue.prototype.$ELEMENT = { size: Cookies.get('size') || 'mini' };
  instance = new Vue({
    router,
    store,
    render: h => h(App),
  });

  instance.$mount(container ? container.querySelector('#sub-app') : '#sub-app');
}

// 子应用独立运行的环境
if (!window.__POWERED_BY_QIANKUN__) {
  render();
}

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

export async function bootstrap() {
  print(process.env.VUE_APP_TITLE, '[bootstrap]', black, green);
}
export async function mount(props) {
  print(process.env.VUE_APP_TITLE, '[bootstrap]', black, green);
  console.log(
    `%c 获取主应用参数 %c`,
    `background:${black} ; padding: 1px; border-radius: 3px 0 0 3px; color: #fff`,
    'background:transparent;',
    props,
  );

  actions.setActions(props);
  render(props);
}
export async function unmount() {
  print(process.env.VUE_APP_TITLE, '[unmount]', black, red);
  instance.$destroy();
  instance.$el.innerHTML = '';
  instance = null;
  router = null;
}
