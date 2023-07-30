<template>
  <div
    v-if="previewDialogConf.previewVisible"
    class="previewIfram u-mrak"
  >
    <div
      class="btn-close"
      @click="handleClose"
    >
      <i class="el-icon-close icon" />
    </div>

    <div class="previw-box">
      <div class="phone-box">
        <div
          class="phone"
          :style="phoneBoxStyle"
        >
          <iframe
            id="preview-iframe"
            frameborder="0"
            marginwidth="0"
            marginheight="0"
            :style="phoneBoxStyle"
          />
        </div>
      </div>
    </div>

    <div class="info-box">
      <div class="size-box">
        <el-form
          ref="form"
          label-width="100px"
        >
          <el-form-item label="模拟尺寸：">
            <el-select
              v-model="phoneSize"
              placeholder="请选择机型"
            >
              <el-option
                v-for="item in phoneList"
                :key="item.label"
                :label="item.label"
                :value="item.label"
              >
                {{ item.label }}
              </el-option>
            </el-select>
          </el-form-item>

          <el-button @click="copyLink">
            复制链接
          </el-button>
        </el-form>
      </div>
    </div>
  </div>
</template>

<script>
import { previewLandingPage } from '@/api/LandingPage';

export default {
  name: 'PreviewIfram',
  props: {
    previewDialogConf: {
      type: Object,
      default: () => {},
    },
  },
  data() {
    return {
      phoneList: [
        { label: 'iPhone 5/SE', size: { width: 320, height: 568 } },
        { label: 'iPhone 6/7/8', size: { width: 375, height: 667 } },
        { label: 'iPhone 6/7/8 Plus', size: { width: 414, height: 736 } },
        { label: 'iPhone X', size: { width: 375, height: 812 } },
        { label: 'Galaxy Note3', size: { width: 360, height: 640 } },
      ],
      phoneSize: 'iPhone X', // 选择的尺寸
    };
  },
  computed: {
    phoneBoxStyle() {
      let width = 375;
      let height = 667;
      if (this.phoneSize) {
        const target = this.phoneList.find(
          item => item.label === this.phoneSize,
        );
        width = target.size.width;
        height = target.size.height;
      }
      let result = { width: `${width}px`, height: `${height}px` };
      return result;
    },
  },
  watch: {
    'previewDialogConf.previewVisible': {
      handler(val) {
        if (val) {
          this.initPreviewIframe();
        }
      },
    },
  },

  methods: {
    /**
     * 点击复制链接
     */
    copyLink() {
      this.$copyText(this.previewDialogConf.previewUrl).then(
        () => {
          this.$message.success('复制成功');
        },
        () => {
          this.$message.error('复制失败');
        },
      );
    },

    handleClose() {
      this.$emit('update:previewDialogConf', {
        ...this.previewDialogConf,
        previewVisible: false,
      });
    },

    async initPreviewIframe() {
      const res = await previewLandingPage(this.previewDialogConf.previewId);
      const iframe = document.getElementById('preview-iframe');
      iframe.contentWindow.document.body.innerHTML += res; //接口返回的内容
      iframe.contentWindow.document.close(); //关闭文档流
      iframe.height = iframe.contentWindow.document.body.scrollHeight; //设置高度随着内容高度增加
    },
  },
};
</script>

<style lang="scss" scoped>
.u-mrak {
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 1042;
  .btn-close {
    position: absolute;
    top: 20px;
    right: 20px;
    width: 50px;
    height: 50px;
    border: 1px solid #fff;
    border-radius: 100%;
    cursor: pointer;
    .icon {
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 30px;
      width: 100%;
      height: 100%;
      color: #fff;
    }
  }
}
.previw-box {
  position: absolute;
  left: 50%;
  top: 50%;
  width: 700px;
  transform: translate(-50%, -50%);
  .phone {
    width: 375px;
    height: 667px;
    display: inline-block;
    background: #fff;
    box-sizing: content-box;
    border-top: 30px solid #000;
    border-left: 10px solid #000;
    border-right: 10px solid #000;
    border-bottom: 10px solid #000;
    border-radius: 20px;
    transform-origin: 100% 0;
    transform: scale(1);
    &::-webkit-scrollbar {
      display: none;
    }
  }
  .btn-home {
    margin: 10px auto;
    width: 50px;
    height: 50px;
    cursor: pointer;
    border-radius: 100%;
    background-color: #fff;
  }
}
.size-box {
  ::v-deep {
    .el-form-item {
      margin-bottom: 10px;
    }
  }
}
.info-box {
  position: absolute;
  left: 50%;
  top: 50%;
  width: 300px;
  padding: 15px;
  text-align: center;
  transform: translate(50%, -50%);
  background-color: #fff;
  .qr-code {
    img {
      width: 100%;
      height: 100%;
    }
    .qrcode {
      margin: 8px auto;
    }
    .tips {
      padding: 5px 0;
      color: #f00;
    }
  }
  .tool {
    margin-top: 20px;
  }
}
</style>
