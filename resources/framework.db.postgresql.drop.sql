-- ##BC平台的 postgresql 删表脚本##

-- 用于生成hibernate id的序列
DROP SEQUENCE IF EXISTS CORE_SEQUENCE;
DROP SEQUENCE IF EXISTS hibernate_sequence;

-- 网络硬盘
DROP TABLE IF EXISTS BC_NETDISK_COMMENT;
DROP TABLE IF EXISTS BC_NETDISK_SHARE;
DROP TABLE IF EXISTS BC_NETDISK_VISIT;
DROP TABLE IF EXISTS BC_NETDISK_FILE;

-- 刷卡
DROP TABLE IF EXISTS BC_IDCARD_PIC;
DROP TABLE IF EXISTS BC_IDCARD_CHECK;
DROP TABLE IF EXISTS BC_IDCARD;
DROP sequence IF EXISTS IDCARD_SEQUENCE;

-- 测试用的表
DROP TABLE IF EXISTS BC_EXAMPLE;

-- 调查问卷
DROP TABLE IF EXISTS BC_IVG_GRADE;
DROP TABLE IF EXISTS BC_IVG_ANSWER;
DROP TABLE IF EXISTS BC_IVG_RESPOND;
DROP TABLE IF EXISTS BC_IVG_QUESTION_ITEM;
DROP TABLE IF EXISTS BC_IVG_QUESTION;
DROP TABLE IF EXISTS BC_IVG_QUESTIONARY_ACTOR;
DROP TABLE IF EXISTS BC_IVG_QUESTIONARY;

-- 同步记录基表
DROP TABLE IF EXISTS BC_SYNC_BASE;

-- 社保
DROP TABLE IF EXISTS BS_SOCIALSECURITYRULE_DETAIL;
DROP TABLE IF EXISTS BS_SOCIALSECURITYRULE;

-- 籍贯
DROP TABLE IF EXISTS BC_PLACEORIGIN;

-- 报表模板
DROP TABLE IF EXISTS BC_REPORT_HISTORY;
DROP TABLE IF EXISTS BC_REPORT_TASK;
DROP TABLE IF EXISTS BC_REPORT_TEMPLATE_ACTOR;
DROP TABLE IF EXISTS BC_REPORT_TEMPLATE;

-- 模板管理
DROP TABLE IF EXISTS BC_TEMPLATE_TEMPLATE_PARAM;
DROP TABLE IF EXISTS BC_TEMPLATE_PARAM;
DROP TABLE IF EXISTS BC_TEMPLATE;
DROP TABLE IF EXISTS BC_TEMPLATE_TYPE;

-- 用户反馈
DROP TABLE IF EXISTS BC_FEEDBACK_REPLY;
DROP TABLE IF EXISTS BC_FEEDBACK;

-- 电子公告
DROP TABLE IF EXISTS BC_BULLETIN;

-- 文档附件
DROP TABLE IF EXISTS BC_DOCS_ATTACH_HISTORY;
DROP TABLE IF EXISTS BC_DOCS_ATTACH;

-- 系统日志
DROP TABLE IF EXISTS BC_LOG_SYSTEM;
-- 操作日志
DROP TABLE IF EXISTS BC_LOG_AUDIT_ITEM;
DROP TABLE IF EXISTS BC_LOG_OPERATE;

-- 工作事务
DROP TABLE IF EXISTS BC_WORK_TODO;
DROP TABLE IF EXISTS BC_WORK_DONE;
DROP TABLE IF EXISTS BC_WORK;

-- 消息管理
DROP TABLE IF EXISTS BC_MESSAGE;

-- 个性化设置
DROP TABLE IF EXISTS BC_DESKTOP_SHORTCUT;
DROP TABLE IF EXISTS BC_DESKTOP_PERSONAL;

-- 系统标识
DROP TABLE IF EXISTS BC_IDENTITY_ROLE_ACTOR;
DROP TABLE IF EXISTS BC_IDENTITY_AUTH;
DROP TABLE IF EXISTS BC_IDENTITY_ACTOR_RELATION;
DROP TABLE IF EXISTS BC_IDENTITY_ACTOR_HISTORY;
DROP TABLE IF EXISTS BC_IDENTITY_ACTOR;
DROP TABLE IF EXISTS BC_IDENTITY_ACTOR_DETAIL;
DROP TABLE IF EXISTS BC_IDENTITY_DUTY;
DROP TABLE IF EXISTS BC_IDENTITY_IDGENERATOR;
DROP TABLE IF EXISTS BC_IDENTITY_ROLE_RESOURCE;
DROP TABLE IF EXISTS BC_IDENTITY_ROLE;
DROP TABLE IF EXISTS BC_IDENTITY_RESOURCE;

-- 选项模块
DROP TABLE IF EXISTS BC_OPTION_ITEM;
DROP TABLE IF EXISTS BC_OPTION_GROUP;

-- 任务调度
DROP TABLE IF EXISTS BC_SD_LOG;
DROP TABLE IF EXISTS BC_SD_JOB;

-- 删除视图
DROP VIEW IF EXISTS bc_dual;