/*
 * @Author: zhongzihao 1184847189@qq.com
 * @Date: 2022-12-15 20:19:56
 * @LastEditors: zhongzihao 1184847189@qq.com
 * @LastEditTime: 2022-12-15 20:20:06
 * @FilePath: \vue-low-code\vlc-adminv\src\actions.js
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
function emptyAction() {
  console.warn('Current execute action is empty!');
}
class Actions {
  actions = {
    onGlobalStateChange: emptyAction,
    setGlobalState: emptyAction,
  };
  constructor() {}
  setActions(actions) {
    this.actions = actions;
  }
  onGlobalStateChange(...args) {
    return this.actions.onGlobalStateChange(...args);
  }
  setGlobalState(...args) {
    return this.actions.setGlobalState(...args);
  }
}
const actions = new Actions();
export default actions;
