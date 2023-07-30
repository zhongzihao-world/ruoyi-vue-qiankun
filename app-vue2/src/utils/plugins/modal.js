/*
 * @Author: zhongzihao 1184847189@qq.com
 * @Date: 2022-07-03 19:04:35
 * @LastEditors: zhongzihao 1184847189@qq.com
 * @LastEditTime: 2022-07-10 03:13:41
 * @Description: Do not edit
 */
import Vue from 'vue';

let loadingInstance;

export default {
  // 消息提示
  msg(content) {
    Vue.prototype.$message.info(content);
  },
  // 错误消息
  msgError(content) {
    Vue.prototype.$message.error(content);
  },
  // 成功消息
  msgSuccess(content) {
    Vue.prototype.$message.success(content);
  },
  // 警告消息
  msgWarning(content) {
    Vue.prototype.$message.warning(content);
  },
  // 弹出提示
  alert(content) {
    Vue.prototype.$msgbox.alert(content, '系统提示');
  },
  // 错误提示
  alertError(content) {
    Vue.prototype.$msgbox.alert(content, '系统提示', { type: 'error' });
  },
  // 成功提示
  alertSuccess(content) {
    Vue.prototype.$msgbox.alert(content, '系统提示', { type: 'success' });
  },
  // 警告提示
  alertWarning(content) {
    Vue.prototype.$msgbox.alert(content, '系统提示', { type: 'warning' });
  },
  // 通知提示
  notify(content) {
    Vue.prototype.$notify.info(content);
  },
  // 错误通知
  notifyError(content) {
    Vue.prototype.$notify.error(content);
  },
  // 成功通知
  notifySuccess(content) {
    Vue.prototype.$notify.success(content);
  },
  // 警告通知
  notifyWarning(content) {
    Vue.prototype.$notify.warning(content);
  },
  // 确认窗体
  confirm(content) {
    return Vue.prototype.$msgbox.confirm(content, '系统提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    });
  },
  // 提交内容
  prompt(content) {
    return Vue.prototype.$msgbox.prompt(content, '系统提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    });
  },
  // 打开遮罩层
  loading(content) {
    loadingInstance = Vue.prototype.$loading.service({
      lock: true,
      text: content,
      spinner: 'el-icon-loading',
      background: 'rgba(0, 0, 0, 0.7)',
    });
  },
  // 关闭遮罩层
  closeLoading() {
    loadingInstance.close();
  },
};
