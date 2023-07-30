<template>
  <div class="app-container">
    <el-row>
      <el-button 
        v-hasPermi="['app-vue2-testBtn']"
        type="primary" 
        size="small"
      >
        测试按钮
      </el-button>

      <p>这是测试按钮，权限由主应用控制</p>
    </el-row>

    <el-table :data="tableData">
      <el-table-column
        v-for="column in tableColumns"
        :key="column.prop"
        :label="column.label"
        :prop="column.prop"
      />

      <el-table-column label="操作">
        <template>
          <el-button
            type="text"
            size="small"
          >
            预览
          </el-button>

          <el-button 
            type="text" 
            size="small"
          >
            编辑
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  name: 'Index',
  data() {
    return {
      tableColumns: [
        {
          label: '页面id',
          prop: 'id',
        },
        {
          label: '名称',
          prop: 'name',
        },
        {
          label: '状态',
          prop: 'status',
        },
      ],
      tableData: [
        {
          id: 1,
          name: '村超奖品抢眼：鸡鹅羊猪牛轮番上场热',
          status: '已发布',
        },
        {
          id: 2,
          name: '中央气象台史上第二个暴雨红色预警热',
          status: '已发布',
        },
        {
          id: 1,
          name: '青春之火 照亮梦想之路',
          status: '已发布',
        },
      ],
    };
  },
  methods: {},
};
</script>

<style scoped lang="scss"></style>
