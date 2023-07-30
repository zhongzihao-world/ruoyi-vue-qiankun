// ESlint 检查配置
module.exports = {
  root: true,
  parserOptions: {
    parser: 'babel-eslint',
    sourceType: 'module',
  },
  env: {
    browser: true,
    node: true,
    es6: true,
  },
  extends: ['plugin:vue/recommended', 'eslint:recommended'],
  // add your custom rules here
  // it is base on https://github.com/vuejs/eslint-config-vue
  rules: {
    // enUS: all rules docs https://eslint.org/docs/rules/
    // zhCN: 所有规则文档 https://eslint.bootcss.com/docs/rules/
    semi: ['error', 'always'], // 以分号结尾
    quotes: [
      2,
      'single',
      {
        avoidEscape: true,
        allowTemplateLiterals: true,
      },
    ], // 强制使用一致的反勾号、双引号或单引号
    'quote-props': 'off',
    'comma-dangle': ['error', 'always-multiline'], // 结尾逗号
    'comma-style': ['error', 'last'], // 一致的逗号风格
    camelcase: 0, // 关闭强驼峰检测
    'no-console': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    'no-empty': 'off', // 禁止出现空语句块
    'no-mixed-operators': 'off', // 禁止混合使用不同的操作符 'error','off'
    'no-unused-vars': [0], // 禁止出现未使用过的变量
    'no-useless-escape': 'off', // 禁用不必要的转义字符
    'block-spacing': ['error', 'always'], // 禁止或强制在代码块中开括号前和闭括号后有空格
    'linebreak-style': [0, 'error', 'windows'], // 强制使用一致的换行风格
    'object-curly-spacing': ['error', 'always'], // 强制在大括号中使用一致的空格
    'import/no-unresolved': [0, { ignore: ['^@/'] }], // @ 是设置的路径别名
    // vue 专用
    'vue/attribute-hyphenation': 0, // 关闭 vue 组件驼峰检测
    'vue/no-mutating-props': 'off',
  },
};
