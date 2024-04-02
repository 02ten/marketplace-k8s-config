CREATE DATABASE marketplace;
\c marketplace;
create table t_role
(
    id   bigserial
        primary key,
    vale varchar(255)
);
INSERT INTO t_role (id, vale) VALUES (1, 'USER'), (2, 'ADMIN'), (3, 'SELLER');
create table t_user
(
    id         bigserial
        primary key,
    first_name varchar(255),
    last_name  varchar(255),
    login      varchar(255),
    password   varchar(255)
);
create table t_user_roles
(
    user_id  bigint not null
        constraint fkpqntgokae5e703qb206xvfdk3
            references t_user,
    roles_id bigint not null
        constraint fkbpogutbfkdk86cqbrh6k6b7dl
            references role,
    primary key (user_id, roles_id)
);
create table t_category
(
    id   bigserial
        primary key,
    name varchar(255)
);
create table t_product
(
    id          bigserial
        primary key,
    description varchar(255),
    name        varchar(255),
    price       double precision not null,
    user_id     bigint,
    category_id bigint
        constraint fkp17nkwpqnnxh5iax87dc58sp3
            references t_category
);