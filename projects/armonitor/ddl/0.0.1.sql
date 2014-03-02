
    create table ARM_AGENT (
        C_GUID varchar(255) not null,
        C_OPLOCK integer,
        C_AUTH smallint,
        C_PASSWORD varchar(255),
        C_TYPE varchar(255),
        C_URL varchar(255),
        C_USER varchar(255),
        primary key (C_GUID)
    );

    create table ARM_APP (
        C_GUID varchar(255) not null,
        C_OPLOCK integer,
        C_ENABLED smallint,
        C_NAME varchar(255),
        C_REPO_LINK varchar(255),
        C_SCM_BRANCHES varchar(255),
        C_SCM_REPO varchar(255),
        C_SCM_TAG varchar(255),
        C_SCM_TRUNK varchar(255),
        C_PROJECT varchar(255),
        C_SCM varchar(255),
        primary key (C_GUID)
    );

    create table ARM_BTS (
        C_GUID varchar(255) not null,
        C_OPLOCK integer,
        C_AUTH smallint,
        C_LINK varchar(255),
        C_PASWORD varchar(255),
        C_SERVER varchar(255),
        C_TYPE varchar(255),
        C_USER varchar(255),
        primary key (C_GUID)
    );

    create table ARM_BUILD (
        C_GUID varchar(255) not null,
        C_OPLOCK integer,
        C_AGENT varchar(255),
        C_MVN_ARTIFACT_ID varchar(255),
        C_BUILD varchar(255),
        C_DATE timestamp,
        C_MVN_GROUP_ID varchar(255),
        C_MVN_VERSION varchar(255),
        C_SCM varchar(255),
        C_SERVICE varchar(255),
        C_UID varchar(255),
        C_VERSION integer,
        C_APP varchar(255),
        primary key (C_GUID)
    );

    create table ARM_BUILD_PARAM (
        C_GUID varchar(255) not null,
        C_OPLOCK integer,
        C_NAME varchar(255),
        C_TYPE varchar(255),
        C_VALUE varchar(255),
        C_BUILD varchar(255),
        primary key (C_GUID)
    );

    create table ARM_CONFIG (
        C_GUID varchar(255) not null,
        C_OPLOCK integer,
        C_CLASS varchar(255),
        primary key (C_GUID)
    );

    create table ARM_CONFIG_ATTR (
        C_GUID varchar(255) not null,
        C_OPLOCK integer,
        C_NAME varchar(255),
        C_VALUE varchar(255),
        C_CONFIG varchar(255),
        primary key (C_GUID)
    );

    create table ARM_PASSWORD (
        C_GUID varchar(255) not null,
        C_OPLOCK integer,
        C_PASSWORD1 varchar(255),
        C_PASSWORD2 varchar(255),
        C_USER varchar(255),
        primary key (C_GUID)
    );

    create table ARM_PROJECT (
        C_GUID varchar(255) not null,
        C_OPLOCK integer,
        C_BTS_ID varchar(255),
        C_ENABLED smallint,
        C_NAME varchar(255),
        C_BTS varchar(255),
        primary key (C_GUID)
    );

    create table ARM_ROLE (
        C_GUID varchar(255) not null,
        C_OPLOCK integer,
        C_NAME varchar(255) not null unique,
        primary key (C_GUID)
    );

    create table ARM_SCM (
        C_GUID varchar(255) not null,
        C_OPLOCK integer,
        C_AUTH smallint,
        C_CONN_TIMEOUT integer,
        C_LINK varchar(255),
        C_PASWORD varchar(255),
        C_READ_TIMEOUT integer,
        C_SERVER varchar(255),
        C_TYPE varchar(255),
        C_USER varchar(255),
        primary key (C_GUID)
    );

    create table ARM_SYSTEM (
        C_GUID varchar(255) not null,
        C_OPLOCK integer,
        C_ENABLED smallint,
        C_KEY varchar(255),
        C_NAME varchar(255),
        C_NOTIFY smallint,
        C_SERVICE varchar(255),
        C_TIMER smallint,
        C_AGENT varchar(255),
        C_APP varchar(255),
        primary key (C_GUID)
    );

    create table ARM_SYSTEM_BUILD (
        C_GUID varchar(255) not null,
        C_OPLOCK integer,
        C_DATE timestamp,
        C_TYPE varchar(255),
        C_BUILD varchar(255),
        C_SYSTEM varchar(255),
        primary key (C_GUID)
    );

    create table ARM_SYS_ROLE (
        C_SYSTEM varchar(255) not null,
        C_ROLE varchar(255) not null,
        primary key (C_SYSTEM, C_ROLE)
    );

    create table ARM_USER (
        C_GUID varchar(255) not null,
        C_OPLOCK integer,
        C_EMAIL varchar(255) not null unique,
        C_LOGIN smallint,
        C_NAME varchar(255),
        primary key (C_GUID)
    );

    create table ARM_USER_ROLE (
        C_USER varchar(255) not null,
        C_ROLE varchar(255) not null,
        primary key (C_USER, C_ROLE)
    );

    alter table ARM_APP 
        add constraint FKFECBAD7E59683E73 
        foreign key (C_SCM) 
        references ARM_SCM;

    alter table ARM_APP 
        add constraint FKFECBAD7E5E43C35C 
        foreign key (C_PROJECT) 
        references ARM_PROJECT;

    alter table ARM_BUILD 
        add constraint FK7AA6928BC06B9B 
        foreign key (C_APP) 
        references ARM_APP;

    alter table ARM_BUILD_PARAM 
        add constraint FK1395C1B9ECB7FC86 
        foreign key (C_BUILD) 
        references ARM_BUILD;

    alter table ARM_CONFIG_ATTR 
        add constraint FK452F2F4B2D3D623C 
        foreign key (C_CONFIG) 
        references ARM_CONFIG;

    alter table ARM_PROJECT 
        add constraint FK4B187FF61D564940 
        foreign key (C_BTS) 
        references ARM_BTS;

    alter table ARM_SYSTEM 
        add constraint FKF76B2992EC8EF5B4 
        foreign key (C_AGENT) 
        references ARM_AGENT;

    alter table ARM_SYSTEM 
        add constraint FKF76B2992C06B9B 
        foreign key (C_APP) 
        references ARM_APP;

    alter table ARM_SYSTEM_BUILD 
        add constraint FK2BDC6561ECB7FC86 
        foreign key (C_BUILD) 
        references ARM_BUILD;

    alter table ARM_SYSTEM_BUILD 
        add constraint FK2BDC6561E4C669F4 
        foreign key (C_SYSTEM) 
        references ARM_SYSTEM;

    alter table ARM_SYS_ROLE 
        add constraint FKC9E8096BE6A8F402 
        foreign key (C_ROLE) 
        references ARM_ROLE;

    alter table ARM_SYS_ROLE 
        add constraint FKC9E8096BE4C669F4 
        foreign key (C_SYSTEM) 
        references ARM_SYSTEM;

    alter table ARM_USER_ROLE 
        add constraint FK324D5227E6ABCAAC 
        foreign key (C_USER) 
        references ARM_USER;

    alter table ARM_USER_ROLE 
        add constraint FK324D5227E6A8F402 
        foreign key (C_ROLE) 
        references ARM_ROLE;
