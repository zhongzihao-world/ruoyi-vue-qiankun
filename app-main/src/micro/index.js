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
