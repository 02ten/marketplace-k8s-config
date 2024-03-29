CREATE DATABASE marketplace;
\c marketplace;
create table role
(
    id   bigserial
        primary key,
    vale varchar(255)
);
INSERT INTO role (id, vale) VALUES (1, 'USER'), (2, 'ADMIN'), (3, 'SELLER');
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