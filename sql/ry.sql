/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306 root/root
Source Server Version : 80033
Source Host           : localhost:3306
Source Database       : ry

Target Server Type    : MYSQL
Target Server Version : 80033
File Encoding         : 65001

Date: 2023-07-30 19:21:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `gen_table`
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for `gen_table_column`
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-11-17 23:03:13', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-11-17 23:03:13', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-11-17 23:03:13', '', null, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2022-11-17 23:03:13', '', null, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-11-17 23:03:13', '', null, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-17 23:03:12', '', null);
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-17 23:03:12', '', null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-17 23:03:12', '', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-17 23:03:12', '', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-17 23:03:12', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-17 23:03:12', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-17 23:03:12', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-17 23:03:12', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-17 23:03:12', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-17 23:03:12', '', null);

-- ----------------------------
-- Table structure for `sys_dict_data`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-11-17 23:03:13', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-11-17 23:03:13', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-11-17 23:03:13', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-11-17 23:03:13', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-11-17 23:03:13', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-11-17 23:03:13', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-11-17 23:03:13', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-11-17 23:03:13', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '99', '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '其他操作');
INSERT INTO `sys_dict_data` VALUES ('19', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('21', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('22', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('23', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('24', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('25', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-11-17 23:03:13', '', null, '停用状态');

-- ----------------------------
-- Table structure for `sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2022-11-17 23:03:13', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2022-11-17 23:03:13', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2022-11-17 23:03:13', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2022-11-17 23:03:13', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2022-11-17 23:03:13', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2022-11-17 23:03:13', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2022-11-17 23:03:13', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2022-11-17 23:03:13', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2022-11-17 23:03:13', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2022-11-17 23:03:13', '', null, '登录状态列表');

-- ----------------------------
-- Table structure for `sys_job`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-11-17 23:03:14', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-11-17 23:03:14', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-11-17 23:03:14', '', null, '');

-- ----------------------------
-- Table structure for `sys_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_logininfor`
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-19 19:17:38');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-19 19:31:00');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-19 19:40:59');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-19 19:42:38');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-19 19:57:53');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-19 19:58:00');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-19 20:40:07');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-19 20:47:43');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-19 20:47:51');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-19 20:48:00');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-19 20:58:39');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-19 20:58:47');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-19 21:00:14');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-19 21:00:38');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-20 02:54:54');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-20 13:28:06');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-20 14:55:42');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-11-20 15:24:35');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-11-20 15:24:36');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-20 15:25:45');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-21 00:32:58');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '223.73.150.217', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-21 00:33:26');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-21 00:40:03');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '223.73.150.217', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-21 00:47:38');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '223.73.150.217', 'XX XX', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2022-11-21 00:47:43');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '223.73.150.217', 'XX XX', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2022-11-21 00:47:43');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '223.73.150.217', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-11-21 00:47:46');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '223.73.150.217', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-21 00:47:50');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '223.73.150.217', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码已失效', '2022-11-21 13:32:50');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '223.73.150.217', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-21 13:32:54');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2022-11-23 11:07:59');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2022-11-23 11:07:59');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2022-11-23 11:08:10');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2022-11-23 11:08:10');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-23 11:08:32');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-23 11:20:23');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-23 11:20:33');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2022-11-23 12:13:54');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-23 12:13:57');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-23 14:59:27');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '223.73.150.217', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-23 15:53:06');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '223.73.150.217', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-11-23 19:43:42');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '223.73.150.217', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-23 19:43:48');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '223.73.150.217', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-23 19:50:53');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '223.73.150.217', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-23 19:50:58');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-11-23 19:56:47');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-23 19:56:55');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '223.73.150.58', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-24 13:19:41');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-24 13:23:51');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-24 13:48:51');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-11-24 13:50:11');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-24 13:50:13');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-24 13:58:33');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-24 14:05:54');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-24 14:06:04');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-25 14:03:49');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-25 16:12:56');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-25 16:26:23');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-25 17:09:29');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-25 17:21:49');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2022-11-25 17:24:23');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-25 17:24:26');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-25 18:16:30');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-25 18:16:42');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome 65', 'Windows 10', '1', '密码输入错误1次', '2022-11-25 18:22:26');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome 65', 'Windows 10', '1', '用户不存在/密码错误', '2022-11-25 18:22:36');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome 65', 'Windows 10', '0', '登录成功', '2022-11-25 18:22:45');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome 65', 'Windows 10', '0', '登录成功', '2022-11-25 18:23:50');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-25 19:12:20');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2022-11-25 23:38:22');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-25 23:38:26');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-25 23:55:09');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-11-26 00:02:04');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-11-26 01:05:27');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '154.89.14.238', 'XX XX', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-11-26 15:43:43');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '154.89.14.238', 'XX XX', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-11-26 15:43:43');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '154.89.14.238', 'XX XX', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2022-11-26 15:43:47');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '154.89.14.238', 'XX XX', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-11-26 15:43:47');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '154.89.14.238', 'XX XX', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次', '2022-11-26 15:43:59');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '154.89.14.238', 'XX XX', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-11-26 15:43:59');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '154.89.14.238', 'XX XX', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-11-26 15:44:03');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '154.89.14.238', 'XX XX', 'Chrome 10', 'Windows 10', '1', '密码输入错误4次', '2022-11-26 15:44:03');
INSERT INTO `sys_logininfor` VALUES ('182', 'admin', '120.239.174.130', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-02 17:26:05');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-12-03 22:15:49');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-03 22:15:52');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-03 22:21:59');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2022-12-03 22:24:43');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-03 22:24:52');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-04 13:04:30');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-04 13:10:04');
INSERT INTO `sys_logininfor` VALUES ('190', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-12-04 13:10:18');
INSERT INTO `sys_logininfor` VALUES ('191', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-04 13:10:24');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-05 23:54:21');
INSERT INTO `sys_logininfor` VALUES ('193', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2022-12-06 01:03:54');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-06 01:04:00');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-12-06 01:04:08');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-06 01:04:11');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-06 01:09:32');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-06 01:09:42');
INSERT INTO `sys_logininfor` VALUES ('199', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-06 19:54:50');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-06 20:57:08');
INSERT INTO `sys_logininfor` VALUES ('201', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2022-12-06 21:01:59');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-06 21:02:58');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-06 23:53:51');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-07 00:02:43');
INSERT INTO `sys_logininfor` VALUES ('205', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-07 00:02:48');
INSERT INTO `sys_logininfor` VALUES ('206', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-07 00:02:48');
INSERT INTO `sys_logininfor` VALUES ('207', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-07 00:13:56');
INSERT INTO `sys_logininfor` VALUES ('208', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-07 00:23:03');
INSERT INTO `sys_logininfor` VALUES ('209', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-07 00:23:11');
INSERT INTO `sys_logininfor` VALUES ('210', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-12-07 22:04:19');
INSERT INTO `sys_logininfor` VALUES ('211', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-07 22:04:22');
INSERT INTO `sys_logininfor` VALUES ('212', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 00:39:48');
INSERT INTO `sys_logininfor` VALUES ('213', 'admin', '120.239.174.7', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 01:21:16');
INSERT INTO `sys_logininfor` VALUES ('214', 'admin', '14.215.222.17', 'XX XX', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-08 17:14:26');
INSERT INTO `sys_logininfor` VALUES ('215', 'admin', '14.215.222.17', 'XX XX', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-08 17:14:26');
INSERT INTO `sys_logininfor` VALUES ('216', 'admin', '120.239.174.7', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 18:28:46');
INSERT INTO `sys_logininfor` VALUES ('217', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 18:50:11');
INSERT INTO `sys_logininfor` VALUES ('218', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 18:50:18');
INSERT INTO `sys_logininfor` VALUES ('219', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 18:50:28');
INSERT INTO `sys_logininfor` VALUES ('220', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-08 19:01:12');
INSERT INTO `sys_logininfor` VALUES ('221', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 19:02:10');
INSERT INTO `sys_logininfor` VALUES ('222', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 20:33:16');
INSERT INTO `sys_logininfor` VALUES ('223', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 20:38:27');
INSERT INTO `sys_logininfor` VALUES ('224', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 20:38:33');
INSERT INTO `sys_logininfor` VALUES ('225', 'admin', '120.239.174.7', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 20:55:37');
INSERT INTO `sys_logininfor` VALUES ('226', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-08 21:01:15');
INSERT INTO `sys_logininfor` VALUES ('227', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 21:01:26');
INSERT INTO `sys_logininfor` VALUES ('228', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-12-08 22:42:57');
INSERT INTO `sys_logininfor` VALUES ('229', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 22:43:01');
INSERT INTO `sys_logininfor` VALUES ('230', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-08 22:47:57');
INSERT INTO `sys_logininfor` VALUES ('231', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 22:48:01');
INSERT INTO `sys_logininfor` VALUES ('232', 'admin', '120.239.174.7', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 23:12:49');
INSERT INTO `sys_logininfor` VALUES ('233', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-08 23:24:13');
INSERT INTO `sys_logininfor` VALUES ('234', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 23:24:37');
INSERT INTO `sys_logininfor` VALUES ('235', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-08 23:35:16');
INSERT INTO `sys_logininfor` VALUES ('236', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-08 23:35:22');
INSERT INTO `sys_logininfor` VALUES ('237', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-08 23:51:28');
INSERT INTO `sys_logininfor` VALUES ('238', 'admin', '120.239.174.7', 'XX XX', 'Chrome 65', 'Windows 10', '1', '密码输入错误1次', '2022-12-08 23:56:44');
INSERT INTO `sys_logininfor` VALUES ('239', 'admin', '120.239.174.7', 'XX XX', 'Chrome 65', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-08 23:56:44');
INSERT INTO `sys_logininfor` VALUES ('240', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 00:26:18');
INSERT INTO `sys_logininfor` VALUES ('241', 'admin', '120.239.174.7', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码已失效', '2022-12-09 20:05:29');
INSERT INTO `sys_logininfor` VALUES ('242', 'admin', '120.239.174.7', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 20:05:32');
INSERT INTO `sys_logininfor` VALUES ('243', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-12-09 20:14:04');
INSERT INTO `sys_logininfor` VALUES ('244', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 20:14:07');
INSERT INTO `sys_logininfor` VALUES ('245', 'admin', '127.0.0.1', '内网IP', 'Chrome 65', 'Windows 10', '1', '密码输入错误1次', '2022-12-09 20:15:54');
INSERT INTO `sys_logininfor` VALUES ('246', 'admin', '127.0.0.1', '内网IP', 'Chrome 65', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 20:15:54');
INSERT INTO `sys_logininfor` VALUES ('247', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-09 20:15:58');
INSERT INTO `sys_logininfor` VALUES ('248', 'admin', '127.0.0.1', '内网IP', 'Chrome 65', 'Windows 10', '0', '登录成功', '2022-12-09 20:16:18');
INSERT INTO `sys_logininfor` VALUES ('249', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 20:16:41');
INSERT INTO `sys_logininfor` VALUES ('250', 'admin', '127.0.0.1', '内网IP', 'Chrome 65', 'Windows 10', '0', '退出成功', '2022-12-09 20:30:26');
INSERT INTO `sys_logininfor` VALUES ('251', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-09 20:30:26');
INSERT INTO `sys_logininfor` VALUES ('252', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-12-09 20:30:27');
INSERT INTO `sys_logininfor` VALUES ('253', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-12-09 20:30:30');
INSERT INTO `sys_logininfor` VALUES ('254', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 20:30:32');
INSERT INTO `sys_logininfor` VALUES ('255', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 20:50:21');
INSERT INTO `sys_logininfor` VALUES ('256', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-09 20:50:27');
INSERT INTO `sys_logininfor` VALUES ('257', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 21:00:37');
INSERT INTO `sys_logininfor` VALUES ('258', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-09 21:00:44');
INSERT INTO `sys_logininfor` VALUES ('259', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 21:00:52');
INSERT INTO `sys_logininfor` VALUES ('260', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-09 21:19:26');
INSERT INTO `sys_logininfor` VALUES ('261', 'admin', '120.239.174.7', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 21:25:16');
INSERT INTO `sys_logininfor` VALUES ('262', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-09 21:28:56');
INSERT INTO `sys_logininfor` VALUES ('263', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 21:29:01');
INSERT INTO `sys_logininfor` VALUES ('264', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-09 21:36:43');
INSERT INTO `sys_logininfor` VALUES ('265', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 21:39:20');
INSERT INTO `sys_logininfor` VALUES ('266', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 21:52:22');
INSERT INTO `sys_logininfor` VALUES ('267', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-09 21:52:26');
INSERT INTO `sys_logininfor` VALUES ('268', 'admin', '120.239.174.7', 'XX XX', 'Chrome 65', 'Windows 10', '1', '密码输入错误1次', '2022-12-09 21:55:40');
INSERT INTO `sys_logininfor` VALUES ('269', 'admin', '120.239.174.7', 'XX XX', 'Chrome 65', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 21:55:40');
INSERT INTO `sys_logininfor` VALUES ('270', 'admin', '120.239.174.7', 'XX XX', 'Chrome 65', 'Windows 10', '0', '登录成功', '2022-12-09 21:56:00');
INSERT INTO `sys_logininfor` VALUES ('271', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 22:00:24');
INSERT INTO `sys_logininfor` VALUES ('272', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-09 22:00:27');
INSERT INTO `sys_logininfor` VALUES ('273', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 22:00:28');
INSERT INTO `sys_logininfor` VALUES ('274', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-09 22:07:38');
INSERT INTO `sys_logininfor` VALUES ('275', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 22:12:36');
INSERT INTO `sys_logininfor` VALUES ('276', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 22:14:09');
INSERT INTO `sys_logininfor` VALUES ('277', 'admin', '120.239.174.7', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-09 23:09:12');
INSERT INTO `sys_logininfor` VALUES ('278', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-10 01:58:08');
INSERT INTO `sys_logininfor` VALUES ('279', 'admin', '120.239.174.7', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-10 02:11:58');
INSERT INTO `sys_logininfor` VALUES ('280', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-10 02:12:33');
INSERT INTO `sys_logininfor` VALUES ('281', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-10 02:29:29');
INSERT INTO `sys_logininfor` VALUES ('282', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-10 21:16:09');
INSERT INTO `sys_logininfor` VALUES ('283', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-10 21:32:05');
INSERT INTO `sys_logininfor` VALUES ('284', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-10 21:32:59');
INSERT INTO `sys_logininfor` VALUES ('285', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-10 21:46:52');
INSERT INTO `sys_logininfor` VALUES ('286', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-10 21:46:57');
INSERT INTO `sys_logininfor` VALUES ('287', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-10 22:06:56');
INSERT INTO `sys_logininfor` VALUES ('288', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-10 22:07:04');
INSERT INTO `sys_logininfor` VALUES ('289', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-10 22:17:40');
INSERT INTO `sys_logininfor` VALUES ('290', 'admin', '120.239.174.7', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-12-10 22:19:00');
INSERT INTO `sys_logininfor` VALUES ('291', 'admin', '120.239.174.7', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-10 22:19:04');
INSERT INTO `sys_logininfor` VALUES ('292', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-11 02:05:18');
INSERT INTO `sys_logininfor` VALUES ('293', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-11 02:19:49');
INSERT INTO `sys_logininfor` VALUES ('294', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-11 02:19:54');
INSERT INTO `sys_logininfor` VALUES ('295', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-12-11 02:20:01');
INSERT INTO `sys_logininfor` VALUES ('296', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-11 02:20:05');
INSERT INTO `sys_logininfor` VALUES ('297', 'admin', '120.239.174.7', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-11 02:40:32');
INSERT INTO `sys_logininfor` VALUES ('298', 'admin', '120.239.174.240', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-11 13:56:58');
INSERT INTO `sys_logininfor` VALUES ('299', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-11 13:59:58');
INSERT INTO `sys_logininfor` VALUES ('300', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-11 14:12:24');
INSERT INTO `sys_logininfor` VALUES ('301', 'admin', '120.239.174.240', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-11 14:55:39');
INSERT INTO `sys_logininfor` VALUES ('302', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-11 15:09:53');
INSERT INTO `sys_logininfor` VALUES ('303', 'admin', '120.239.174.240', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-11 17:33:07');
INSERT INTO `sys_logininfor` VALUES ('304', 'admin', '120.239.174.240', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码已失效', '2022-12-12 19:30:42');
INSERT INTO `sys_logininfor` VALUES ('305', 'admin', '120.239.174.240', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-12 19:30:46');
INSERT INTO `sys_logininfor` VALUES ('306', 'admin', '120.239.174.240', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-12 23:04:47');
INSERT INTO `sys_logininfor` VALUES ('307', 'admin', '120.239.174.240', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-13 19:12:50');
INSERT INTO `sys_logininfor` VALUES ('308', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-13 22:49:49');
INSERT INTO `sys_logininfor` VALUES ('309', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2022-12-13 22:49:57');
INSERT INTO `sys_logininfor` VALUES ('310', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2022-12-13 22:50:03');
INSERT INTO `sys_logininfor` VALUES ('311', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-13 22:50:07');
INSERT INTO `sys_logininfor` VALUES ('312', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-13 22:50:13');
INSERT INTO `sys_logininfor` VALUES ('313', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-12-13 22:50:15');
INSERT INTO `sys_logininfor` VALUES ('314', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2022-12-13 22:50:18');
INSERT INTO `sys_logininfor` VALUES ('315', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-13 22:50:18');
INSERT INTO `sys_logininfor` VALUES ('316', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-13 22:50:25');
INSERT INTO `sys_logininfor` VALUES ('317', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2022-12-13 22:50:25');
INSERT INTO `sys_logininfor` VALUES ('318', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-13 22:50:53');
INSERT INTO `sys_logininfor` VALUES ('319', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误3次', '2022-12-13 22:50:53');
INSERT INTO `sys_logininfor` VALUES ('320', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-13 22:51:12');
INSERT INTO `sys_logininfor` VALUES ('321', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-13 23:39:04');
INSERT INTO `sys_logininfor` VALUES ('322', 'admin', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-14 20:36:47');
INSERT INTO `sys_logininfor` VALUES ('323', 'admin', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-14 21:07:19');
INSERT INTO `sys_logininfor` VALUES ('324', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-14 21:15:42');
INSERT INTO `sys_logininfor` VALUES ('325', 'admin', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-14 21:34:48');
INSERT INTO `sys_logininfor` VALUES ('326', 'ry', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2022-12-14 21:35:01');
INSERT INTO `sys_logininfor` VALUES ('327', 'ry', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-14 21:35:01');
INSERT INTO `sys_logininfor` VALUES ('328', 'ruoyi', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '1', '登录用户：ruoyi 不存在', '2022-12-14 21:35:08');
INSERT INTO `sys_logininfor` VALUES ('329', 'ruoyi', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '1', '登录用户：ruoyi 不存在', '2022-12-14 21:35:14');
INSERT INTO `sys_logininfor` VALUES ('330', 'admin', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-14 21:35:19');
INSERT INTO `sys_logininfor` VALUES ('331', 'admin', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-14 21:35:35');
INSERT INTO `sys_logininfor` VALUES ('332', 'ry', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-14 21:35:42');
INSERT INTO `sys_logininfor` VALUES ('333', 'ry', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-14 21:35:52');
INSERT INTO `sys_logininfor` VALUES ('334', 'admin', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-14 21:35:57');
INSERT INTO `sys_logininfor` VALUES ('335', 'ry', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-14 21:36:14');
INSERT INTO `sys_logininfor` VALUES ('336', 'admin', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2022-12-14 23:25:48');
INSERT INTO `sys_logininfor` VALUES ('337', 'admin', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-14 23:25:48');
INSERT INTO `sys_logininfor` VALUES ('338', 'ry', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-14 23:25:55');
INSERT INTO `sys_logininfor` VALUES ('339', 'admin', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-12-14 23:26:50');
INSERT INTO `sys_logininfor` VALUES ('340', 'admin', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-14 23:26:52');
INSERT INTO `sys_logininfor` VALUES ('341', 'admin', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-15 00:10:25');
INSERT INTO `sys_logininfor` VALUES ('342', 'admin', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-15 20:06:34');
INSERT INTO `sys_logininfor` VALUES ('343', 'admin', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-15 21:54:13');
INSERT INTO `sys_logininfor` VALUES ('344', 'admin', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2022-12-15 21:55:12');
INSERT INTO `sys_logininfor` VALUES ('345', 'ry', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-15 21:55:20');
INSERT INTO `sys_logininfor` VALUES ('346', 'ry', '120.239.174.254', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2022-12-16 00:18:37');
INSERT INTO `sys_logininfor` VALUES ('347', 'ry', '120.236.245.14', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-16 17:00:17');
INSERT INTO `sys_logininfor` VALUES ('348', 'admin', '117.140.252.207', 'XX XX', 'Firefox 10', 'Windows 10', '1', '密码输入错误1次', '2023-01-30 23:54:38');
INSERT INTO `sys_logininfor` VALUES ('349', 'admin', '117.140.252.207', 'XX XX', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-30 23:54:38');
INSERT INTO `sys_logininfor` VALUES ('350', 'admin', '117.140.252.207', 'XX XX', 'Firefox 10', 'Windows 10', '1', '密码输入错误2次', '2023-01-30 23:54:44');
INSERT INTO `sys_logininfor` VALUES ('351', 'admin', '117.140.252.207', 'XX XX', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-30 23:54:44');
INSERT INTO `sys_logininfor` VALUES ('352', 'admin', '117.140.252.207', 'XX XX', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次', '2023-01-30 23:54:48');
INSERT INTO `sys_logininfor` VALUES ('353', 'admin', '117.140.252.207', 'XX XX', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-30 23:54:48');
INSERT INTO `sys_logininfor` VALUES ('354', 'admin', '117.136.0.193', 'XX XX', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-10 15:55:07');
INSERT INTO `sys_logininfor` VALUES ('355', 'admin', '117.136.0.193', 'XX XX', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-02-10 15:55:07');
INSERT INTO `sys_logininfor` VALUES ('356', 'admin', '117.136.0.193', 'XX XX', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2023-02-10 15:55:15');
INSERT INTO `sys_logininfor` VALUES ('357', 'admin', '117.136.0.193', 'XX XX', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-10 15:55:15');
INSERT INTO `sys_logininfor` VALUES ('358', 'admin', '171.37.137.105', 'XX XX', 'Firefox 10', 'Windows 10', '1', '密码输入错误1次', '2023-03-28 05:02:56');
INSERT INTO `sys_logininfor` VALUES ('359', 'admin', '171.37.137.105', 'XX XX', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-28 05:02:56');
INSERT INTO `sys_logininfor` VALUES ('360', 'admin', '171.37.137.105', 'XX XX', 'Firefox 10', 'Windows 10', '1', '验证码错误', '2023-03-28 05:06:32');
INSERT INTO `sys_logininfor` VALUES ('361', 'admin', '171.37.137.105', 'XX XX', 'Firefox 10', 'Windows 10', '1', '密码输入错误2次', '2023-03-28 05:06:36');
INSERT INTO `sys_logininfor` VALUES ('362', 'admin', '171.37.137.105', 'XX XX', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-28 05:06:36');
INSERT INTO `sys_logininfor` VALUES ('363', 'admin', '116.8.43.220', 'XX XX', 'Firefox 10', 'Windows 10', '1', '密码输入错误1次', '2023-06-12 04:17:33');
INSERT INTO `sys_logininfor` VALUES ('364', 'admin', '116.8.43.220', 'XX XX', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-12 04:17:33');
INSERT INTO `sys_logininfor` VALUES ('365', 'admin', '116.8.43.220', 'XX XX', 'Firefox 10', 'Windows 10', '1', '密码输入错误2次', '2023-06-12 04:17:40');
INSERT INTO `sys_logininfor` VALUES ('366', 'admin', '116.8.43.220', 'XX XX', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-12 04:17:40');
INSERT INTO `sys_logininfor` VALUES ('367', 'ry', '116.8.43.220', 'XX XX', 'Firefox 10', 'Windows 10', '0', '登录成功', '2023-06-12 04:17:44');
INSERT INTO `sys_logininfor` VALUES ('368', 'ry', '116.8.43.220', 'XX XX', 'Firefox 10', 'Windows 10', '0', '退出成功', '2023-06-12 04:17:54');
INSERT INTO `sys_logininfor` VALUES ('369', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-07-29 23:20:09');
INSERT INTO `sys_logininfor` VALUES ('370', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-29 23:20:09');
INSERT INTO `sys_logininfor` VALUES ('371', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-29 23:20:48');
INSERT INTO `sys_logininfor` VALUES ('372', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-07-29 23:20:48');
INSERT INTO `sys_logininfor` VALUES ('373', 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-29 23:22:15');
INSERT INTO `sys_logininfor` VALUES ('374', 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-07-29 23:22:15');
INSERT INTO `sys_logininfor` VALUES ('375', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-07-29 23:23:38');
INSERT INTO `sys_logininfor` VALUES ('376', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-29 23:23:38');
INSERT INTO `sys_logininfor` VALUES ('377', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-29 23:24:43');
INSERT INTO `sys_logininfor` VALUES ('378', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-07-29 23:24:43');
INSERT INTO `sys_logininfor` VALUES ('379', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-29 23:29:29');
INSERT INTO `sys_logininfor` VALUES ('380', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-30 01:40:49');
INSERT INTO `sys_logininfor` VALUES ('381', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-30 17:52:51');
INSERT INTO `sys_logininfor` VALUES ('382', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-07-30 18:04:18');
INSERT INTO `sys_logininfor` VALUES ('383', 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-07-30 18:04:24');
INSERT INTO `sys_logininfor` VALUES ('384', 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-30 18:04:26');
INSERT INTO `sys_logininfor` VALUES ('385', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-30 18:04:40');
INSERT INTO `sys_logininfor` VALUES ('386', 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-07-30 18:05:37');
INSERT INTO `sys_logininfor` VALUES ('387', 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-30 18:05:44');
INSERT INTO `sys_logininfor` VALUES ('388', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-30 19:07:10');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '100', 'system', null, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2022-11-17 23:03:12', 'admin', '2022-12-11 15:25:51', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '200', 'monitor', null, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2022-11-17 23:03:12', 'admin', '2022-12-11 15:26:02', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '300', '300', null, '', '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2022-11-17 23:03:12', 'admin', '2022-12-11 17:37:40', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-11-17 23:03:12', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-11-17 23:03:12', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-11-17 23:03:12', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-11-17 23:03:12', '', null, '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-11-17 23:03:12', '', null, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-11-17 23:03:12', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-11-17 23:03:12', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-11-17 23:03:12', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2022-11-17 23:03:12', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-11-17 23:03:12', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-11-17 23:03:12', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-11-17 23:03:12', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-11-17 23:03:12', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-11-17 23:03:12', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '缓存列表', '2', '6', 'cacheList', 'monitor/cache/list', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2022-11-17 23:03:12', '', null, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES ('115', '表单构建', '3', '1', 'build', 'tool/build/index', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-11-17 23:03:12', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('116', '代码生成', '3', '2', 'gen', 'tool/gen/index', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-11-17 23:03:12', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('117', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-11-17 23:03:12', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-11-17 23:03:12', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-11-17 23:03:12', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '日志导出', '500', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '登录查询', '501', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录删除', '501', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '日志导出', '501', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '账户解锁', '501', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-11-17 23:03:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-11-17 23:03:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-11-17 23:03:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-11-17 23:03:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-11-17 23:03:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-11-17 23:03:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '6', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-11-17 23:03:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '116', '1', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-11-17 23:03:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '116', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-11-17 23:03:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '116', '3', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-11-17 23:03:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '116', '4', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-11-17 23:03:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '116', '5', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-11-17 23:03:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '116', '6', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-11-17 23:03:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('2000', '子应用-vue2', '0', '10', 'app/vue2', '', null, '1', '0', 'M', '0', '0', '', 'table', 'admin', '2022-11-25 17:34:29', 'admin', '2023-07-30 01:48:18', 'app-vue2');
INSERT INTO `sys_menu` VALUES ('2006', '主页', '2000', '0', 'index', 'index.vue', null, '1', '1', 'C', '0', '0', '', 'dashboard', 'admin', '2023-07-30 02:02:11', 'admin', '2023-07-30 02:02:44', '');
INSERT INTO `sys_menu` VALUES ('2007', '测试按钮', '2000', '1000', '', null, null, '1', '0', 'F', '0', '0', 'app-vue2-testBtn', '#', 'admin', '2023-07-30 18:03:24', 'admin', '2023-07-30 18:07:52', 'app-vue2-testBtn');

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-11-17 23:03:14', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-11-17 23:03:14', '', null, '管理员');

-- ----------------------------
-- Table structure for `sys_oper_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '用户管理', '4', 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', '1', 'admin', null, '/system/user/authRole', '127.0.0.1', '内网IP', '2 []', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-20 02:56:38');
INSERT INTO `sys_oper_log` VALUES ('101', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', '1', 'admin', null, '/system/user/profile/updatePwd', '223.73.150.217', 'XX XX', '\"admin123\" \"#zhong123456!@\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-21 00:47:32');
INSERT INTO `sys_oper_log` VALUES ('102', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"落地页应用\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/sub/vlc/landingPage/list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-25 17:34:29');
INSERT INTO `sys_oper_log` VALUES ('103', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/subapp/vlc/landingPage/list\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-25 17:51:41');
INSERT INTO `sys_oper_log` VALUES ('104', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/sub/vlc/\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-04 13:12:10');
INSERT INTO `sys_oper_log` VALUES ('105', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"sub/vlc/\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-04 13:15:03');
INSERT INTO `sys_oper_log` VALUES ('106', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"subapp/vlc/landingPage/list\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-04 13:17:32');
INSERT INTO `sys_oper_log` VALUES ('107', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"landingPage/list\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-04 13:20:33');
INSERT INTO `sys_oper_log` VALUES ('108', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"subapp/vlc\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-04 13:23:22');
INSERT INTO `sys_oper_log` VALUES ('109', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/sub/vlc\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-05 23:56:34');
INSERT INTO `sys_oper_log` VALUES ('110', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"sub/vlc\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-06 00:01:26');
INSERT INTO `sys_oper_log` VALUES ('111', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/vlc\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-06 01:22:16');
INSERT INTO `sys_oper_log` VALUES ('112', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"landingPage\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-06 19:55:24');
INSERT INTO `sys_oper_log` VALUES ('113', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"LandingPage/List/Index.vue\",\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"list\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-06 19:56:44');
INSERT INTO `sys_oper_log` VALUES ('114', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"LandingPage/List/Index.vue\",\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"landingPage\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-06 19:57:29');
INSERT INTO `sys_oper_log` VALUES ('115', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"LandingPage/List/Index.vue\",\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"落地页列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-06 19:58:17');
INSERT INTO `sys_oper_log` VALUES ('116', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"LandingPage/List/Index.vue\",\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"app/landingPage\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-07 22:14:48');
INSERT INTO `sys_oper_log` VALUES ('117', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"LandingPage/List/Index.vue\",\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"app/sirius\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-08 00:54:33');
INSERT INTO `sys_oper_log` VALUES ('118', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"落地页管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"landingPage\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-08 00:55:06');
INSERT INTO `sys_oper_log` VALUES ('119', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"LandingPage/List/Index.vue\",\"createTime\":\"2022-12-06 19:58:17\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"落地页列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"list\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-08 00:55:28');
INSERT INTO `sys_oper_log` VALUES ('120', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"app/sirius\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-10 21:40:18');
INSERT INTO `sys_oper_log` VALUES ('121', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"LandingPage/List/Index.vue\",\"createTime\":\"2022-12-06 19:58:17\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"list\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-10 22:24:25');
INSERT INTO `sys_oper_log` VALUES ('122', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '120.239.174.7', 'XX XX', '{\"children\":[],\"component\":\"LandingPage/Edit/Index.vue\",\"createBy\":\"admin\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"创建/编辑\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"path\":\"edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-10 22:30:08');
INSERT INTO `sys_oper_log` VALUES ('123', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '120.239.174.7', 'XX XX', '{\"children\":[],\"component\":\"LandingPage/Edit/Index.vue\",\"createTime\":\"2022-12-10 22:30:07\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"创建/编辑\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"path\":\"edit\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-10 22:30:28');
INSERT INTO `sys_oper_log` VALUES ('124', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"LandingPage/Edit/Index.vue\",\"createTime\":\"2022-12-10 22:30:07\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"创建/编辑\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"path\":\"edit\",\"perms\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-11 02:05:50');
INSERT INTO `sys_oper_log` VALUES ('125', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-11-17 23:03:12\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":100,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-11 15:25:51');
INSERT INTO `sys_oper_log` VALUES ('126', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-11-17 23:03:12\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":200,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-11 15:26:02');
INSERT INTO `sys_oper_log` VALUES ('127', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-11-17 23:03:12\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"300\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-11 15:26:08');
INSERT INTO `sys_oper_log` VALUES ('128', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"app/sirius\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-11 15:26:13');
INSERT INTO `sys_oper_log` VALUES ('129', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '120.239.174.240', 'XX XX', '{\"children\":[],\"createTime\":\"2022-11-17 23:03:12\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":300,\"params\":{},\"parentId\":0,\"path\":\"300\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-11 17:37:40');
INSERT INTO `sys_oper_log` VALUES ('130', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"A\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"app/sirius\",\"perms\":\"\",\"remark\":\"app-sirius\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-13 22:36:51');
INSERT INTO `sys_oper_log` VALUES ('131', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"落地页应用\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"app/sirius\",\"perms\":\"\",\"remark\":\"app-sirius\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-13 22:41:36');
INSERT INTO `sys_oper_log` VALUES ('132', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"LandingPage/Edit/Index.vue\",\"createTime\":\"2022-12-10 22:30:07\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"创建/编辑\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"path\":\"edit\",\"perms\":\"\",\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-13 22:44:04');
INSERT INTO `sys_oper_log` VALUES ('133', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"LandingPage/Edit/Index.vue\",\"createTime\":\"2022-12-10 22:30:07\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"创建/编辑\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"path\":\"edit\",\"perms\":\"\",\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-13 22:44:09');
INSERT INTO `sys_oper_log` VALUES ('134', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2002,\"perms\":\"sirius:landingPage:add\",\"remark\":\"新增\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-14 21:16:42');
INSERT INTO `sys_oper_log` VALUES ('135', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑\",\"menuType\":\"F\",\"orderNum\":11,\"params\":{},\"parentId\":2002,\"perms\":\"sirius:landingPage:edit\",\"remark\":\"编辑\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-14 21:17:03');
INSERT INTO `sys_oper_log` VALUES ('136', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', '1', 'admin', null, '/system/user/resetPwd', '120.239.174.254', 'XX XX', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-14 21:35:32');
INSERT INTO `sys_oper_log` VALUES ('137', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '120.239.174.254', 'XX XX', '{\"admin\":false,\"createTime\":\"2022-11-17 23:03:12\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2002,2001,2003,2004,2005],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-14 21:36:31');
INSERT INTO `sys_oper_log` VALUES ('138', '用户管理', '4', 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', '1', 'admin', null, '/system/user/authRole', '120.239.174.254', 'XX XX', '2 [2]', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-14 21:36:55');
INSERT INTO `sys_oper_log` VALUES ('139', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '120.239.174.254', 'XX XX', '{\"admin\":false,\"createTime\":\"2022-11-17 23:03:12\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2002,2001,2003,2004],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-14 21:37:16');
INSERT INTO `sys_oper_log` VALUES ('140', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '120.239.174.254', 'XX XX', '{\"admin\":false,\"createTime\":\"2022-11-17 23:03:12\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2002,2001,2005],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-12-14 21:37:29');
INSERT INTO `sys_oper_log` VALUES ('141', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"子应用-vue2\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"app/sirius\",\"perms\":\"\",\"remark\":\"app-sirius\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-30 01:47:18');
INSERT INTO `sys_oper_log` VALUES ('142', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-11-25 17:34:29\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"子应用-vue2\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"app/vue2\",\"perms\":\"\",\"remark\":\"app-vue2\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-30 01:48:18');
INSERT INTO `sys_oper_log` VALUES ('143', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"子应用主页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-30 02:02:11');
INSERT INTO `sys_oper_log` VALUES ('144', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-07-30 02:02:11\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"主页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"index\",\"perms\":\"\",\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-30 02:02:22');
INSERT INTO `sys_oper_log` VALUES ('145', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"index.vue\",\"createTime\":\"2023-07-30 02:02:11\",\"icon\":\"dashboard\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"主页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"index\",\"perms\":\"\",\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-30 02:02:44');
INSERT INTO `sys_oper_log` VALUES ('146', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-12-08 00:55:06\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"落地页管理\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":2000,\"path\":\"landingPage\",\"perms\":\"\",\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-30 02:02:58');
INSERT INTO `sys_oper_log` VALUES ('147', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2005', '127.0.0.1', '内网IP', '{menuId=2005}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', '0', null, '2023-07-30 02:04:06');
INSERT INTO `sys_oper_log` VALUES ('148', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-11-17 23:03:12\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-30 02:04:17');
INSERT INTO `sys_oper_log` VALUES ('149', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2005', '127.0.0.1', '内网IP', '{menuId=2005}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-30 02:04:26');
INSERT INTO `sys_oper_log` VALUES ('150', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2004', '127.0.0.1', '内网IP', '{menuId=2004}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-30 02:04:28');
INSERT INTO `sys_oper_log` VALUES ('151', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2003', '127.0.0.1', '内网IP', '{menuId=2003}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-30 02:04:29');
INSERT INTO `sys_oper_log` VALUES ('152', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2001', '127.0.0.1', '内网IP', '{menuId=2001}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-30 02:04:30');
INSERT INTO `sys_oper_log` VALUES ('153', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2002', '127.0.0.1', '内网IP', '{menuId=2002}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-30 02:04:32');
INSERT INTO `sys_oper_log` VALUES ('154', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"app-vue2-testBtn\",\"menuType\":\"F\",\"orderNum\":1000,\"params\":{},\"parentId\":2000,\"remark\":\"app-vue2-testBtn\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-30 18:03:24');
INSERT INTO `sys_oper_log` VALUES ('155', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-11-17 23:03:12\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2006,2007],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-30 18:04:51');
INSERT INTO `sys_oper_log` VALUES ('156', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-11-17 23:03:12\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2023-07-30 18:04:26\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-30 18:05:23');
INSERT INTO `sys_oper_log` VALUES ('157', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-07-30 18:03:24\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"测试按钮\",\"menuType\":\"F\",\"orderNum\":1000,\"params\":{},\"parentId\":2000,\"path\":\"\",\"perms\":\"app-vue2-testBtn\",\"remark\":\"app-vue2-testBtn\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-30 18:07:52');

-- ----------------------------
-- Table structure for `sys_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2022-11-17 23:03:12', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2022-11-17 23:03:12', '', null, '');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2022-11-17 23:03:12', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2022-11-17 23:03:12', 'admin', '2023-07-30 18:04:51', '普通角色');

-- ----------------------------
-- Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '2000');
INSERT INTO `sys_role_menu` VALUES ('2', '2006');
INSERT INTO `sys_role_menu` VALUES ('2', '2007');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-07-30 19:07:10', 'admin', '2022-11-17 23:03:12', '', '2023-07-30 19:07:10', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-07-30 18:05:44', 'admin', '2022-11-17 23:03:12', 'admin', '2023-07-30 18:05:44', '测试员');

-- ----------------------------
-- Table structure for `sys_user_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
