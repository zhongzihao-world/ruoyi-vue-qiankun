## 介绍

> 基于**RuoYi-Vue**，使用 qiankun 实现微前端；主应用基于 **vue2**，目前接入 **vue2** 子应用。

环境：

- JDK >= 1.8
- MySQL >= 5.7
- Maven >= 3.0
- Node >= 12
- Redis >= 3

技术框架：

- vue：2.6.12
- qiankun：2.8.4
- spring-boot：2.5.14

项目地址：[ruoyi-vue-qiankun](https://github.com/zhongzihao-world/ruoyi-vue-qiankun)

文档参考：
* [RuoYi-Vue](https://doc.ruoyi.vip/ruoyi-vue/)
* [qiankun](https://qiankun.umijs.org/zh)

## 项目运行

### 1. 前端

启动主应用，启动端口：**9001**

```sh
cd app-main
npm i
npm run dev
```


![image.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/69bef85941d8420eadc234d77811961d~tplv-k3u1fbpfcp-jj-mark:0:0:0:0:q75.image#?w=1907&h=390&e=png&b=ffffff)

启动子应用，启动端口：**9002**

```sh
cd app-vue2 
npm i
npm run dev
```

![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/5d9d836dc9234ae5a1ff6d85a246975e~tplv-k3u1fbpfcp-jj-mark:0:0:0:0:q75.image#?w=1901&h=402&e=png&b=ffffff)

#### 2. 后端

启动端口：**9000**

使用 IDEA 运行，具体可参考 [RuoYi 后端运行](https://doc.ruoyi.vip/ruoyi-vue/document/hjbs.html#%E5%87%86%E5%A4%87%E5%B7%A5%E4%BD%9C)

## 接入问题

### 1. 打包部署

使用 nginx 进行部署，主应用(main)、子应用(vue2)部署在同一个目录

```bash
├── main
└── vue2
```

修改 nginx 配置，允许子应用跨域访问：

```bash
http {
  # 主应用
  server {
    listen 9001;
    location / {
      root D:\\develop\\nginx-1.23.0\\html\\main;
      index index.html index.html;
      try_files $uri $uri/ /index.html;

      if ($request_filename ~ .*\.(htm|html)$) {
        add_header Cache-Control no-store;
      }
    }
  }

  # 子应用
  server {
    listen 9002;
    location / {
      root D:\\develop\\nginx-1.23.0\\html\\vue2;
      index index.html index.html;
      try_files $uri $uri/ /index.html;
        
      # 跨域配置
      add_header Access-Control-Allow-Origin *;
      add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS';
      add_header Access-Control-Allow-Headers 'DNT,X-Mx-ReqToken,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type';
      add_header Access-Control-Allow-Credentials true;
    }
  }
}
```

[完整 nginx 配置](https://github.com/zhongzihao-world/ruoyi-vue-qiankun/blob/master/nginx.conf)

### 2. 权限改造

由主应用控制子应用的路由、权限

![image.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/a1c94ce882dc43c7a952c52fd4a3bd79~tplv-k3u1fbpfcp-jj-mark:0:0:0:0:q75.image#?w=1920&h=789&e=png&b=ffffff)

#### ①. 主应用

Ⅰ. 新建 micro 目录，存放子应用相关代码

```js
# @/src/micro/index.js
import { registerMicroApps, start } from 'qiankun';

import { filterMicroApps, microAppHooks } from './micro';

// 注册微应用
export const registerApps = () => {
  const microApps = filterMicroApps();
  registerMicroApps(microApps, microAppHooks);
  start({
    prefetch: 'all', // 全量
    sandbox: {
      // strictStyleIsolation: true, // 严格的样式隔离模式 不推荐，大量bug
      experimentalStyleIsolation: true, // 实验性的样式隔离特性
    },
  });
};
```

从 vuex 中拿到所有路由、菜单，根据 `MICRO_APPS`进行过滤并传入对应的子应用中

```js
# @/src/micro/micro.js
import store from '@/store';

// 所有子应用
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
      },
    };
  });
};
```

[完整代码](https://github.com/zhongzihao-world/ruoyi-vue-qiankun/blob/master/app-main/src/micro/index.js)


Ⅱ. 主应用中，创建子应用入口容器 `subapp-viewport`，并在 `mounted` 钩子调用 `registerApps`注册微应用

```vue
<template>
  <section class="app-main">
    # 子应用容器
    <div id="subapp-viewport" />
    
    # 主应用路由入口
    <transition
      name="fade-transform"
      mode="out-in"
    >
      <keep-alive :include="cachedViews">
        <router-view
          v-if="!$route.meta.link"
          :key="key"
        />
      </keep-alive>
    </transition>
  </section>
</template>

<script>
import { registerApps } from '@/micro';

import iframeToggle from './IframeToggle/index';

export default {
  name: 'AppMain',
  mounted() {
    if (!window.qiankunStarted) {
      window.qiankunStarted = true;
      registerApps();
    }
  },
};
</script>
```

[完整代码](https://github.com/zhongzihao-world/ruoyi-vue-qiankun/blob/master/app-main/src/layout/components/AppMain.vue)


#### ②. 子应用

Ⅰ. 配置 `public-path`

```js
// /src/public-path.js
if (window.__POWERED_BY_QIANKUN__) {
  __webpack_public_path__ = window.__INJECTED_PUBLIC_PATH_BY_QIANKUN__;
}
```

Ⅱ. 修改入口文件 `main.js`

```js
// /src/main.js
import Vue from 'vue';
import VueRouter from 'vue-router';

import App from './App';
import store from './store';
import { constantRoutes } from './router';
import { initRouter } from './router/initRouter';

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

export async function bootstrap() {
}
export async function mount(props) {

  actions.setActions(props);
  render(props);
}
export async function unmount() {
  instance.$destroy();
  instance.$el.innerHTML = '';
  instance = null;
  router = null;
}

```

[完整代码](https://github.com/zhongzihao-world/ruoyi-vue-qiankun/blob/master/app-vue2/src/main.js)

Ⅲ. 修改 `vue.config.js` 配置文件

[完整代码](https://github.com/zhongzihao-world/ruoyi-vue-qiankun/blob/master/app-vue2/vue.config.js)
