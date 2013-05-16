drop table CODE_ORGANIZATION_TYPE cascade constraints;
drop table CODE_ORGANIZATION_GRADE cascade constraints;
drop table CODE_CERTIFICATE_TYPE cascade constraints;

--�������ʹ����
create table CODE_ORGANIZATION_TYPE
(
  CODE   varchar(2)   not null,
  NAME   varchar2(50) not null,
  CHOOSE varchar2(1)  not null
);
comment on table CODE_ORGANIZATION_TYPE is '�������ʹ����';
comment on column CODE_ORGANIZATION_TYPE.CODE is '����';
comment on column CODE_ORGANIZATION_TYPE.NAME is '����';
comment on column CODE_ORGANIZATION_TYPE.CHOOSE is '�Ƿ�ѡ��';
alter table CODE_ORGANIZATION_TYPE add constraint PK_CODE_ORGANIZATION_TYPE_ID primary key (CODE);

insert into CODE_ORGANIZATION_TYPE (code, name, choose) values ('10', 'ҵ��', 'Y');
insert into CODE_ORGANIZATION_TYPE (code, name, choose) values ('20', '����', 'Y');
insert into CODE_ORGANIZATION_TYPE (code, name, choose) values ('30', '�ƻ�', 'Y');
insert into CODE_ORGANIZATION_TYPE (code, name, choose) values ('40', '����', 'Y');
insert into CODE_ORGANIZATION_TYPE (code, name, choose) values ('99', '����', 'Y');
commit;

--������������
create table CODE_ORGANIZATION_GRADE
(
  CODE   varchar(2)   not null,
  NAME   varchar2(50) not null,
  CHOOSE varchar2(1)  not null
);
comment on table CODE_ORGANIZATION_GRADE is '������������';
comment on column CODE_ORGANIZATION_GRADE.CODE is '����';
comment on column CODE_ORGANIZATION_GRADE.NAME is '����';
comment on column CODE_ORGANIZATION_GRADE.CHOOSE is '�Ƿ�ѡ��';
alter table CODE_ORGANIZATION_GRADE add constraint PK_CODE_ORGANIZATION_GRADE_ID primary key (CODE);

insert into CODE_ORGANIZATION_GRADE (code, name, choose) values ('10', '����', 'Y');
insert into CODE_ORGANIZATION_GRADE (code, name, choose) values ('20', '�鼶', 'Y');
insert into CODE_ORGANIZATION_GRADE (code, name, choose) values ('99', '����', 'Y');
commit;

--���֤�����ʹ����
create table CODE_CERTIFICATE_TYPE
(
  CODE   varchar(2)   not null,
  NAME   varchar2(50) not null,
  CHOOSE varchar2(1)  not null
);
comment on table CODE_CERTIFICATE_TYPE is '���֤�����ʹ����';
comment on column CODE_CERTIFICATE_TYPE.CODE is '����';
comment on column CODE_CERTIFICATE_TYPE.NAME is '����';
comment on column CODE_CERTIFICATE_TYPE.CHOOSE is '�Ƿ�ѡ��';
alter table CODE_CERTIFICATE_TYPE add constraint PK_CODE_CERTIFICATE_TYPE_ID primary key (CODE);

insert into CODE_CERTIFICATE_TYPE (code, name, choose) values ('10', '�������֤', 'Y');
insert into CODE_CERTIFICATE_TYPE (code, name, choose) values ('20', '����', 'Y');
commit;