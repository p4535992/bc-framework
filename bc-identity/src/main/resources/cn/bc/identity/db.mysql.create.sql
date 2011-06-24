-- 系统标识相关模块
-- 系统安全相关模块
-- 系统资源
create table BC_IDENTITY_RESOURCE (
    ID int NOT NULL auto_increment,
    UID_ varchar(36) COMMENT '全局标识',
    TYPE_ int(1) NOT NULL COMMENT '类型：1-文件夹,2-内部链接,3-外部链接,4-html',
    STATUS_ int(1) NOT NULL COMMENT '状态：0-已禁用,1-启用中,2-已删除',
    INNER_ int(1) NOT NULL COMMENT '是否为内置对象:0-否,1-是',
    BELONG int COMMENT '所隶属的资源',
    ORDER_ varchar(100) NOT NULL COMMENT '排序号',
    NAME varchar(255) NOT NULL COMMENT '名称',
    URL varchar(255) COMMENT '地址',
    ICONCLASS varchar(255) COMMENT '图标样式',
    OPTION_ text COMMENT '扩展参数',
    primary key (ID)
) COMMENT='系统资源';

-- 角色
create table BC_IDENTITY_ROLE (
    ID int NOT NULL auto_increment,
    CODE varchar(100) NOT NULL COMMENT '编码',
    ORDER_ varchar(100) NOT NULL COMMENT '排序号',
    NAME varchar(255) NOT NULL COMMENT '名称',
    
    UID_ varchar(36) COMMENT '全局标识',
   	TYPE_ int(1) NOT NULL COMMENT '类型',
    STATUS_ int(1) NOT NULL COMMENT '状态：0-已禁用,1-启用中,2-已删除',
    INNER_ int(1) NOT NULL COMMENT '是否为内置对象:0-否,1-是',
    primary key (ID)
) COMMENT='角色';

-- 角色与模块的关联
create table BC_IDENTITY_ROLE_RESOURCE (
    RID int NOT NULL COMMENT '角色ID',
    SID int NOT NULL COMMENT '资源ID',
    primary key (RID,SID)
) COMMENT='角色与资源的关联：角色可以访问哪些资源';
ALTER TABLE BC_IDENTITY_ROLE_RESOURCE ADD CONSTRAINT FK_RS_ROLE FOREIGN KEY (RID) 
	REFERENCES BC_IDENTITY_ROLE (ID);
ALTER TABLE BC_IDENTITY_ROLE_RESOURCE ADD CONSTRAINT FK_RS_RESOURCE FOREIGN KEY (SID) 
	REFERENCES BC_IDENTITY_RESOURCE (ID);

-- 职务
create table BC_IDENTITY_DUTY (
    ID int NOT NULL auto_increment,
    UID_ varchar(36) COMMENT '全局标识',
    STATUS_ int(1) NOT NULL COMMENT '状态：0-已禁用,1-启用中,2-已删除',
    INNER_ int(1) NOT NULL COMMENT '是否为内置对象:0-否,1-是',
    CODE varchar(100) NOT NULL COMMENT '编码',
    NAME varchar(255) NOT NULL COMMENT '名称',
    primary key (ID)
) COMMENT='职务';

-- 参与者的扩展属性
create table BC_IDENTITY_ACTOR_DETAIL (
    ID int NOT NULL auto_increment,
    CREATE_DATE datetime COMMENT '创建时间',
    WORK_DATE date COMMENT 'user-入职时间',
    SEX int(1) NOT NULL default 0 COMMENT 'user-性别：0-未设置,1-男,2-女',
   	CARD varchar(20) COMMENT 'user-身份证',
    DUTY_ID int COMMENT 'user-职务ID',
   	COMMENT varchar(1000) COMMENT '备注',
    primary key (ID)
) COMMENT='参与者的扩展属性';
ALTER TABLE BC_IDENTITY_ACTOR_DETAIL ADD CONSTRAINT FK_ACTORDETAIL_DUTY FOREIGN KEY (DUTY_ID) 
	REFERENCES BC_IDENTITY_DUTY (ID);

-- 参与者
create table BC_IDENTITY_ACTOR (
    ID int NOT NULL auto_increment,
    UID_ varchar(36) NOT NULL COMMENT '全局标识',
    TYPE_ int(1) NOT NULL COMMENT '类型：1-用户,2-单位,3-部门,4-岗位',
    STATUS_ int(1) NOT NULL COMMENT '状态：0-已禁用,1-启用中,2-已删除',
    INNER_ int(1) NOT NULL COMMENT '是否为内置对象:0-否,1-是',
    CODE varchar(100) NOT NULL COMMENT '编码',
    NAME varchar(255) NOT NULL COMMENT '名称',
    PY varchar(255) COMMENT '名称的拼音',
    ORDER_ varchar(100) COMMENT '同类参与者之间的排序号',
    EMAIL varchar(255) COMMENT '邮箱',
    PHONE varchar(255) COMMENT '联系电话',
    DETAIL_ID int COMMENT '扩展表的ID',
    primary key (ID)
) COMMENT='参与者(代表一个人或组织，组织也可以是单位、部门、岗位、团队等)';
ALTER TABLE BC_IDENTITY_ACTOR ADD CONSTRAINT FK_ACTOR_ACTORDETAIL FOREIGN KEY (DETAIL_ID) 
	REFERENCES BC_IDENTITY_ACTOR_DETAIL (ID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE BC_IDENTITY_ACTOR ADD INDEX IDX_ACTOR_TYPE (TYPE_);

-- 参与者之间的关联关系
create table BC_IDENTITY_ACTOR_RELATION (
    TYPE_ int(2) NOT NULL COMMENT '关联类型',
    MASTER_ID int NOT NULL COMMENT '主控方ID',
   	FOLLOWER_ID int NOT NULL COMMENT '从属方ID',
    ORDER_ varchar(100) COMMENT '从属方之间的排序号',
    primary key (MASTER_ID,FOLLOWER_ID,TYPE_)
) COMMENT='参与者之间的关联关系';
ALTER TABLE BC_IDENTITY_ACTOR_RELATION ADD CONSTRAINT FK_AR_MASTER FOREIGN KEY (MASTER_ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID);
ALTER TABLE BC_IDENTITY_ACTOR_RELATION ADD CONSTRAINT FK_AR_FOLLOWER FOREIGN KEY (FOLLOWER_ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID);
ALTER TABLE BC_IDENTITY_ACTOR_RELATION ADD INDEX IDX_AR_TM (TYPE_, MASTER_ID),ADD INDEX IDX_AR_TF (TYPE_, FOLLOWER_ID);

-- 认证信息
create table BC_IDENTITY_AUTH (
    ID int NOT NULL auto_increment COMMENT '与Actor表的id对应',
    PASSWORD varchar(32) NOT NULL COMMENT '密码',
    primary key (ID)
) COMMENT='认证信息';
ALTER TABLE BC_IDENTITY_AUTH ADD CONSTRAINT FK_AUTH_ACTOR FOREIGN KEY (ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID);

-- 标识生成器
CREATE TABLE BC_IDENTITY_IDGENERATOR (
  TYPE_ VARCHAR(45) NOT NULL COMMENT '分类',
  VALUE INT NOT NULL COMMENT '当前值',
  FORMAT VARCHAR(45) COMMENT '格式模板,如“case-${V}”、“${T}-${V}”,V代表value的值，T代表type_的值' ,
  PRIMARY KEY (TYPE_)
) COMMENT = '标识生成器,用于生成主键或唯一编码用';

-- 参与者与角色的关联
create table BC_IDENTITY_ROLE_ACTOR (
    AID int NOT NULL COMMENT '参与者ID',
    RID int NOT NULL COMMENT '角色ID',
    primary key (AID,RID)
) COMMENT='参与者与角色的关联：参与者拥有哪些角色';
ALTER TABLE BC_IDENTITY_ROLE_ACTOR ADD CONSTRAINT FK_RA_ACTOR FOREIGN KEY (AID) 
	REFERENCES BC_IDENTITY_ACTOR (ID);
ALTER TABLE BC_IDENTITY_ROLE_ACTOR ADD CONSTRAINT FK_RA_ROLE FOREIGN KEY (RID) 
	REFERENCES BC_IDENTITY_ROLE (ID);