--��ʼ��
insert into ACCT_AUTHORITY (id, name)
        values (2, '�޸Ļ�������');
insert into ACCT_AUTHORITY (id, name)
        values (4, '�޸��˺Ź���');
insert into ACCT_AUTHORITY (id, name)
        values (1, '�����������');
insert into ACCT_AUTHORITY (id, name)
        values (3, '����˺Ź���');
insert into ACCT_AUTHORITY (id, name)
        values (5, '����������');
commit;

insert into ACCT_ROLE (id, name)
        values (2, '�߼��û�');
insert into ACCT_ROLE (id, name)
        values (1, '����Ա');
insert into ACCT_ROLE (id, name)
        values (3, '��ͨ�û�');
commit;

insert into ACCT_ROLE_AUTHORITY (role_id, authority_id)
        values (1, 1);
insert into ACCT_ROLE_AUTHORITY (role_id, authority_id)
        values (1, 2);
insert into ACCT_ROLE_AUTHORITY (role_id, authority_id)
        values (1, 3);
insert into ACCT_ROLE_AUTHORITY (role_id, authority_id)
        values (1, 4);
insert into ACCT_ROLE_AUTHORITY (role_id, authority_id)
        values (1, 5);
insert into ACCT_ROLE_AUTHORITY (role_id, authority_id)
        values (2, 1);
insert into ACCT_ROLE_AUTHORITY (role_id, authority_id)
        values (2, 3);
insert into ACCT_ROLE_AUTHORITY (role_id, authority_id)
        values (2, 5);
insert into ACCT_ROLE_AUTHORITY (role_id, authority_id)
        values (3, 1);
insert into ACCT_ROLE_AUTHORITY (role_id, authority_id)
        values (3, 5);
commit;

insert into ORG_ORGANIZATION (id, name, shortname, no, grade_code, type_code, create_time, remark, parent_id)
        values (1, 'TaskFlow��Ŀ��', 'TF��', 'TF-100', '10', '10',
                TIMESTAMP'2010-09-07', 'TaskFlow��Ŀ��', null);
insert into ORG_ORGANIZATION (id, name, shortname, no, grade_code, type_code, create_time, remark, parent_id)
        values (2, 'TaskFlow������', 'TFD', 'TF-110', '20', '10',
                TIMESTAMP'2010-09-07', 'TaskFlow������', 1);
insert into ORG_ORGANIZATION (id, name, shortname, no, grade_code, type_code, create_time, remark, parent_id)
        values (3, 'TaskFlow������', 'TFT', 'TF-120', '20', '10',
                TIMESTAMP'2010-09-07', 'TaskFlow������', 1);
insert into ORG_ORGANIZATION (id, name, shortname, no, grade_code, type_code, create_time, remark, parent_id)
        values (4, 'TaskFlow���ù�����', 'TFC', 'TF-130', '20', '10',
                TIMESTAMP'2010-09-07', 'TaskFlow���ù�����', 1);
commit;

insert into ORG_EMPLOYEE (id, name, sex, birthday, certificate_type_code, certificate_no, email, phone_no, create_time, remark, organization_id)
        values (1, '����', '��', null, null, null, null, null,
                TIMESTAMP'2010-09-09', null, 2);
insert into ORG_EMPLOYEE (id, name, sex, birthday, certificate_type_code, certificate_no, email, phone_no, create_time, remark, organization_id)
        values (2, '����', '��', '1985-09-01', null, null, null, null,
                TIMESTAMP'2010-09-08', null, 2);
insert into ORG_EMPLOYEE (id, name, sex, birthday, certificate_type_code, certificate_no, email, phone_no, create_time, remark, organization_id)
        values (3, '����', '��', null, null, null, null, null,
                TIMESTAMP'2010-09-09', null, 4);
insert into ORG_EMPLOYEE (id, name, sex, birthday, certificate_type_code, certificate_no, email, phone_no, create_time, remark, organization_id)
        values (4, '����', '��', null, null, null, null, null,
                TIMESTAMP'2010-09-09', null, 2);
insert into ORG_EMPLOYEE (id, name, sex, birthday, certificate_type_code, certificate_no, email, phone_no, create_time, remark, organization_id)
        values (5, '����', '��', '1983-06-15', null, null, null, null,
                TIMESTAMP'2010-09-07', null, 3);
insert into ORG_EMPLOYEE (id, name, sex, birthday, certificate_type_code, certificate_no, email, phone_no, create_time, remark, organization_id)
        values (6, '����', '��', '1980-01-01', null, null, null, null,
                TIMESTAMP'2010-09-07', null, 1);
commit;

insert into ACCT_USER (id, login_name, password, employee_id)
        values (1, 'user', 'user', null);
insert into ACCT_USER (id, login_name, password, employee_id)
        values (0, 'admin', 'admin', null);
insert into ACCT_USER (id, login_name, password, employee_id)
        values (2, 'zhangsan', 'zhangsan', 2);
insert into ACCT_USER (id, login_name, password, employee_id)
        values (3, 'wangkun', 'wangkun', 6);
insert into ACCT_USER (id, login_name, password, employee_id)
        values (4, 'zhangtao', 'zhanglei', 5);
commit;

insert into ACCT_USER_ROLE (user_id, role_id)
        values (0, 1);
insert into ACCT_USER_ROLE (user_id, role_id)
        values (0, 2);
insert into ACCT_USER_ROLE (user_id, role_id)
        values (1, 2);
insert into ACCT_USER_ROLE (user_id, role_id)
        values (2, 3);
insert into ACCT_USER_ROLE (user_id, role_id)
        values (3, 1);
insert into ACCT_USER_ROLE (user_id, role_id)
        values (3, 2);
insert into ACCT_USER_ROLE (user_id, role_id)
        values (4, 2);
commit;