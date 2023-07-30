import store from '@/store';
import actions from '@/actions';

export function initRouter(props, router) {
  const { routes = {}, permissions = [] } = props;

  // 初始化路由
  store.dispatch('GenerateRoutes', { router, routes });
  // 初始化权限
  store.commit('SET_PERMISSIONS', permissions);

  router.beforeEach((to, from, next) => {
    // console.log('[子应用路由拦截]:', to, from);
    const route = {
      routerBase: props.routerBase,
      fullPath: to.fullPath,
      hash: to.hash,
      meta: to.meta,
      name: to.name,
      params: to.params,
      path: to.path,
      query: to.query,
      matched: [routes].concat(to?.matched || []).map(item => {
        return {
          meta: item.meta,
          name: item.name,
          path: item.path,
          redirect: item.redirect,
        };
      }),
    };
    // 分发子应用路由信息到父应用
    actions.setGlobalState({
      $route: {
        ...route,
      },
    });

    next();
  });

  router.afterEach(() => {});
}
