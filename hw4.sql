create table clubs
(
    id   int auto_increment
        primary key,
    name varchar(20) null,
    constraint id
        unique (id)
);

create table customers
(
    id        int auto_increment
        primary key,
    firstname varchar(20) null,
    lastname  varchar(20) null,
    company   varchar(20) null,
    constraint id
        unique (id)
);

create table customers_clubs_association
(
    id         int auto_increment
        primary key,
    clubId     int not null,
    customerId int not null,
    constraint id
        unique (id),
    constraint customers_clubs_association_ibfk_1
        foreign key (clubId) references clubs (id),
    constraint customers_clubs_association_ibfk_2
        foreign key (customerId) references customers (id)
);

create index clubId
    on customers_clubs_association (clubId);

create index customerId
    on customers_clubs_association (customerId);

create table orders
(
    id         int auto_increment
        primary key,
    product    varchar(20) null,
    cost       int         null,
    customerId int         null,
    constraint id
        unique (id),
    constraint orders_ibfk_1
        foreign key (customerId) references customers (id)
);

create index customerId
    on orders (customerId);


