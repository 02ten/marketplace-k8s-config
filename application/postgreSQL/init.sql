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
create table t_category
(
    id   bigserial
        primary key,
    name varchar(255)
);
INSERT INTO t_category (id, name) VALUES (1, 'Семена'), (2, 'Свежие продукты'), (3, 'Мясо');
create table t_product
(
    id               bigserial
        primary key,
    description      varchar(255),
    name             varchar(255),
    preview_image_id bigint,
    price            double precision not null,
    user_id          bigint,
    category_id      bigint
        constraint fkp17nkwpqnnxh5iax87dc58sp3
            references t_category
);
create table t_cart
(
    id         bigserial
        primary key,
    quantity   bigint,
    user_id    bigint,
    product_id bigint
        constraint fk71g7tegrdc2b7aamcmmof637x
            references t_product
);
create table t_images
(
    id                 bigserial
        primary key,
    bytes              bytea,
    content_type       varchar(255),
    is_preview_image   boolean not null,
    original_file_name varchar(255),
    size               bigint,
    product_id         bigint
        constraint fk2ahxt5kdje6xp5suofqmg2tsu
            references t_product
);
create table t_order
(
    id            bigserial
        primary key,
    active        boolean          not null,
    address       varchar(255),
    creation_date timestamp(6),
    payment       varchar(255),
    summary       double precision not null,
    user_id       bigint
);
create table t_order_products
(
    id                bigserial
        primary key,
    quantity          bigint,
    user_id           bigint,
    product_id        bigint
        constraint fkag13gits5n58hfq3cv07qyk81
            references t_product,
    order_products_id bigint
        constraint fk6nne2jgo1jhov823i8tbt1a18
            references t_order
);
