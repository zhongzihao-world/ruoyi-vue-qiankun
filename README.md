### 介绍

> 基于**RuoYi-Vue**，主应用框架基于 vue2，使用 qiankun 实现微前端，目前支持接入 vue2 子应用。

### 运行截图

主应用、子应用：

![](http://cdn.zhongzihao.cn/github-blog/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20230730221033.png)

主应用控制子应用路由、权限等

![](http://cdn.zhongzihao.cn/github-blog/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20230730221733.png)

### 项目运行

1. 前端

启动主应用，启动端口为 9001

```
cd app-main
npm i
npm run dev
```

启动子应用

```
cd app-vue2 启动端口为 9002
npm i
npm run dev
```

2. 后端

启动端口为 9000

使用 IDEA 运行，具体可参考 [RuoYi 后端运行](https://doc.ruoyi.vip/ruoyi-vue/document/hjbs.html#%E5%87%86%E5%A4%87%E5%B7%A5%E4%BD%9C)

### 系统需求

- JDK >= 1.8
- MySQL >= 5.7
- Maven >= 3.0
- Node >= 12
- Redis >= 3

### 技术框架

前端

| 技术框架 | 版本   |
| -------- | ------ |
| vue      | 2.6.12 |
| qiankun  | 2.8.4  |

后端

| 技术框架    | 版本 |
| ----------- | ---- |
| Spring Boot | 2.2  |
