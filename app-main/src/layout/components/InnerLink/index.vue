<!--
 * @Author: zhongzihao 1184847189@qq.com
 * @Date: 2022-11-19 02:59:45
 * @LastEditors: zhongzihao 1184847189@qq.com
 * @LastEditTime: 2022-11-19 19:51:34
 * @Description: Do not edit
-->
<template>
  <div
    v-loading="loading"
    :style="'height:' + height"
    element-loading-text="正在加载页面，请稍候！"
  >
    <iframe
      :id="iframeId"
      style="width: 100%; height: 100%"
      :src="src"
      frameborder="no"
    />
  </div>
</template>

<script>
export default {
  props: {
    src: {
      type: String,
      default: '/',
    },
    // eslint-disable-next-line vue/require-default-prop
    iframeId: {
      type: String,
    },
  },
  data() {
    return {
      loading: false,
      height: document.documentElement.clientHeight - 94.5 + 'px;',
    };
  },
  mounted() {
    var _this = this;
    const iframeId = ('#' + this.iframeId).replace(/\//g, '\\/');
    const iframe = document.querySelector(iframeId);
    // iframe页面loading控制
    if (iframe.attachEvent) {
      this.loading = true;
      iframe.attachEvent('onload', function () {
        _this.loading = false;
      });
    } else {
      this.loading = true;
      iframe.onload = function () {
        _this.loading = false;
      };
    }
  },
};
</script>
