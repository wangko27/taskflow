drop table ACCT_AUTHORITY cascade constraints;

drop table ACCT_ROLE cascade constraints;

drop table ACCT_ROLE_AUTHORITY cascade constraints;

drop table ORG_ORGANIZATION cascade constraints;

drop table ORG_EMPLOYEE cascade constraints;

drop table ACCT_USER cascade constraints;

drop table ACCT_USER_ROLE cascade constraints;

drop table LOG_OPERATELOG cascade constraints;

drop table TASK_TASK cascade constraints;

drop table TASK_STATELOG cascade constraints;

drop sequence SEQ_TASKFLOW;

create table ACCT_AUTHORITY
(
  id   NUMBER(19) not null,
  name VARCHAR2(255 CHAR) not null
);
comment on table ACCT_AUTHORITY is '权限';
comment on column ACCT_AUTHORITY.id is 'ID';
comment on column ACCT_AUTHORITY.name is '权限名称';
alter table ACCT_AUTHORITY add constraint PK_ACCT_AUTHORITY_ID  primary key (ID);
alter table ACCT_AUTHORITY add constraint UK_ACCT_AUTHORITY_NAME unique (NAME);

create table ACCT_ROLE
(
  id   NUMBER(19) not null,
  name VARCHAR2(255 CHAR) not null
);

comment on table ACCT_ROLE is '角色';
comment on column ACCT_ROLE.id is 'ID';
comment on column ACCT_ROLE.name is '角色名称';
alter table ACCT_ROLE add constraint PK_ACCT_ROLE_ID primary key (ID);
alter table ACCT_ROLE add constraint UK_ACCT_ROLE_NAME unique (NAME);

create table ACCT_ROLE_AUTHORITY
(
  role_id      NUMBER(19) not null,
  authority_id NUMBER(19) not null
);
comment on table ACCT_ROLE_AUTHORITY is '角色权限关系';
comment on column ACCT_ROLE_AUTHORITY.role_id is '角色ID';
comment on column ACCT_ROLE_AUTHORITY.authority_id is '权限ID';
alter table ACCT_ROLE_AUTHORITY
add constraint FK_ACCT_ROLE_AUTHORITY_ROLE_ID foreign key (ROLE_ID)
references ACCT_ROLE (ID);
alter table ACCT_ROLE_AUTHORITY
add constraint FK_ACCT_ROLE_AUT_AUT_ID foreign key (AUTHORITY_ID)
references ACCT_AUTHORITY (ID);

create table ORG_ORGANIZATION
(
  id          NUMBER(19) not null,
  name        VARCHAR2(100 CHAR) not null,
  shortname   VARCHAR2(50 CHAR),
  no          VARCHAR2(20 CHAR),
  grade_code  VARCHAR2(2 CHAR),
  type_code   VARCHAR2(2 CHAR),
  create_time DATE not null,
  remark      VARCHAR2(255 CHAR),
  parent_id   NUMBER(19)
);
comment on table ORG_ORGANIZATION is '机构';
comment on column ORG_ORGANIZATION.id is 'ID';
comment on column ORG_ORGANIZATION.create_time is '创建时间';
comment on column ORG_ORGANIZATION.grade_code is '级别代码';
comment on column ORG_ORGANIZATION.name is '机构名称';
comment on column ORG_ORGANIZATION.no is '编号';
comment on column ORG_ORGANIZATION.remark is '备注';
comment on column ORG_ORGANIZATION.shortname is '简称';
comment on column ORG_ORGANIZATION.type_code is '类型代码';
comment on column ORG_ORGANIZATION.parent_id is '父机构ID';
alter table ORG_ORGANIZATION add constraint PK_ORG_ORGANIZATION_ID primary key (ID);
alter table ORG_ORGANIZATION
add constraint FK_ORG_ORGANIZATION_PARENT_ID foreign key (PARENT_ID)
references ORG_ORGANIZATION (ID);

create table ORG_EMPLOYEE
(
  id                    NUMBER(19) not null,
  name                  VARCHAR2(100 CHAR) not null,
  sex                   VARCHAR2(2 CHAR),
  birthday              VARCHAR2(10 CHAR),
  certificate_type_code VARCHAR2(2 CHAR),
  certificate_no        VARCHAR2(30 CHAR),
  email                 VARCHAR2(50 CHAR),
  phone_no              VARCHAR2(11 CHAR),
  create_time           DATE not null,
  remark                VARCHAR2(255 CHAR),
  organization_id       NUMBER(19)
);
comment on table ORG_EMPLOYEE is '职员';
comment on column ORG_EMPLOYEE.id is 'ID';
comment on column ORG_EMPLOYEE.birthday is '生日';
comment on column ORG_EMPLOYEE.certificate_no is '证件号码';
comment on column ORG_EMPLOYEE.certificate_type_code is '证件类型代码';
comment on column ORG_EMPLOYEE.create_time is '创建时间';
comment on column ORG_EMPLOYEE.email is '电子邮箱';
comment on column ORG_EMPLOYEE.name is '姓名';
comment on column ORG_EMPLOYEE.phone_no is '手机号';
comment on column ORG_EMPLOYEE.remark is '备注';
comment on column ORG_EMPLOYEE.sex is '性别';
comment on column ORG_EMPLOYEE.organization_id is '机构ID';
alter table ORG_EMPLOYEE add constraint PK_ORG_EMPLOYEE_ID primary key (ID);
alter table ORG_EMPLOYEE
add constraint FK_ORG_EMPLOYEE_ORG_ID foreign key (ORGANIZATION_ID)
references ORG_ORGANIZATION (ID);

create table ACCT_USER
(
  id          NUMBER(19) not null,
  login_name  VARCHAR2(20 CHAR) not null,
  password    VARCHAR2(20 CHAR),
  employee_id NUMBER(19)
);
comment on table ACCT_USER is '用户';
comment on column ACCT_USER.id is 'ID';
comment on column ACCT_USER.login_name is '登录名';
comment on column ACCT_USER.password is '密码';
comment on column ACCT_USER.employee_id is '职员ID';
alter table ACCT_USER add constraint PK_ACCT_USER_ID primary key (ID);
alter table ACCT_USER add constraint UK_ACCT_USER_LOGIN_NAME unique (LOGIN_NAME);
alter table ACCT_USER add constraint UK_ACCT_USER_EMPLOYEE_ID unique (EMPLOYEE_ID);
alter table ACCT_USER
add constraint FK_ACCT_USER_EMPLOYEE_ID foreign key (EMPLOYEE_ID)
references ORG_EMPLOYEE (ID);

create table ACCT_USER_ROLE
(
  user_id NUMBER(19) not null,
  role_id NUMBER(19) not null
);
comment on table ACCT_USER_ROLE is '用户角色关系';
comment on column ACCT_USER_ROLE.user_id is '用户ID';
comment on column ACCT_USER_ROLE.role_id is '角色ID';
alter table ACCT_USER_ROLE
add constraint FK_ACCT_USER_ROLE_ROLE_ID foreign key (ROLE_ID)
references ACCT_ROLE (ID);
alter table ACCT_USER_ROLE
add constraint FK_ACCT_USER_ROLE_USER_ID foreign key (USER_ID)
references ACCT_USER (ID);

create table LOG_OPERATELOG
(
  id                NUMBER(19) not null,
  employee_name     VARCHAR2(100 CHAR),
  operate_time      DATE,
  operate_type      VARCHAR2(3 CHAR),
  organization_name VARCHAR2(100 CHAR),
  user_login_name   VARCHAR2(20 CHAR)
);
comment on column LOG_OPERATELOG.id is 'ID';
comment on column LOG_OPERATELOG.employee_name is '职员姓名';
comment on column LOG_OPERATELOG.operate_time is '操作时间';
comment on column LOG_OPERATELOG.operate_type is '操作类型';
comment on column LOG_OPERATELOG.organization_name is '机构名称';
comment on column LOG_OPERATELOG.user_login_name is '用户登录名';
alter table LOG_OPERATELOG add constraint PK_LOG_OPERATELOG_ID primary key (ID);

create table TASK_TASK
(
  id                  NUMBER(19) not null,
  name                VARCHAR2(100 CHAR) not null,
  content             VARCHAR2(2000 CHAR),
  type_code           VARCHAR2(2 CHAR),
  belong_employee_id  NUMBER(19),
  create_employee_id  NUMBER(19),
  create_time         DATE,
  start_time          DATE,
  end_time            DATE,
  state               VARCHAR2(10 CHAR)
);
comment on table TASK_TASK is '任务';
comment on column TASK_TASK.id is 'ID';
comment on column TASK_TASK.belong_employee_id is '所属职员ID';
comment on column TASK_TASK.content is '内容';
comment on column TASK_TASK.create_time is '创建时间';
comment on column TASK_TASK.create_employee_id is '创建职员ID';
comment on column TASK_TASK.end_time is '结束时间';
comment on column TASK_TASK.name is '任务名称';
comment on column TASK_TASK.start_time is '开始时间';
comment on column TASK_TASK.state is '状态';
comment on column TASK_TASK.type_code is '类型代码';
alter table TASK_TASK add constraint PK_TASK_TASK_ID primary key (ID);
alter table TASK_TASK
add constraint FK_TASK_TASK_BELONG_EM_ID foreign key (BELONG_EMPLOYEE_ID)
references ORG_EMPLOYEE (ID);
alter table TASK_TASK
add constraint FK_TASK_TASK_CREATE_EM_ID foreign key (CREATE_EMPLOYEE_ID)
references ORG_EMPLOYEE (ID);

create table TASK_STATELOG
(
  ID                          NUMBER(19) not null,
  TASK_ID                     NUMBER(19) not null,
  OPERATE_TIME                DATE not null,
  OPERATE_TASK_STATE          VARCHAR2(30 CHAR) not null,
  OPERATE_EMPLOYEE_NAME       VARCHAR2(100 CHAR),
  OPERATE_EMPLOYEE_LOGIN_NAME VARCHAR2(20 CHAR),
  CREATE_EMPLOYEE_NAME        VARCHAR2(100 CHAR),
  BELONG_EMPLOYEE_NAME        VARCHAR2(100 CHAR)
);
comment on table TASK_STATELOG is '任务状态日志';
comment on column TASK_STATELOG.ID is 'ID';
comment on column TASK_STATELOG.TASK_ID is '任务ID';
comment on column TASK_STATELOG.OPERATE_TIME is '操作时间';
comment on column TASK_STATELOG.OPERATE_TASK_STATE is '操作任务状态';
comment on column TASK_STATELOG.OPERATE_EMPLOYEE_NAME is '操作职员姓名';
comment on column TASK_STATELOG.OPERATE_EMPLOYEE_LOGIN_NAME is '操作职员登录名';
comment on column TASK_STATELOG.CREATE_EMPLOYEE_NAME is '创建职员姓名';
comment on column TASK_STATELOG.BELONG_EMPLOYEE_NAME is '所属职员姓名';
alter table TASK_STATELOG add constraint PK_TASK_STATELOG_ID primary key (ID);
alter table TASK_STATELOG
add constraint FK_TASK_STATELOG_TASK_ID foreign key (TASK_ID)
references TASK_TASK (ID);

create sequence SEQ_TASKFLOW;

--与代码表的外间关联（需要先执行代码表SQL）
alter table ORG_ORGANIZATION
add constraint FK_ORG_ORGANIZATION_TYPE_CODE foreign key (TYPE_CODE)
references code_organization_type (CODE);

alter table ORG_ORGANIZATION
add constraint FK_ORG_ORGANIZATION_GRADE_CODE foreign key (GRADE_CODE)
references code_organization_grade (CODE);

alter table ORG_EMPLOYEE
add constraint FK_ORG_EMPLOYEE_CERTI_TYPE foreign key (CERTIFICATE_TYPE_CODE)
references CODE_CERTIFICATE_TYPE (CODE);