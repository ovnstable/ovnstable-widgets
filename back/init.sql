CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE SCHEMA IF NOT EXISTS widget;


drop table if exists widget.distribution_rate;
create table widget.distribution_rate
(
    label       varchar primary key,
    normal_dist decimal,
    ovn_dist    decimal,
    created_at  timestamp,
    updated_at  timestamp
);


drop table if exists widget.interest_rate;
create table widget.interest_rate
(
    id         uuid primary key,
    date       varchar,
    value      decimal,
    created_at timestamp,
    updated_at timestamp
);

drop table if exists widget.polybor_weeks_table;
create table widget.polybor_weeks_table
(
    id         uuid primary key,
    label      varchar,
    latest     decimal,
    week_ago   decimal,
    high       decimal,
    low        decimal,
    created_at timestamp,
    updated_at timestamp
);

drop table if exists widget.polybor_week;
create table widget.polybor_week
(
    id         uuid primary key,
    latest     decimal,
    week       decimal,
    day        decimal,
    created_at timestamp,
    updated_at timestamp
);

drop table if exists widget.polybor;
create table widget.polybor
(
    id         uuid primary key,
    latest     decimal,
    week       decimal,
    day        decimal,
    created_at timestamp,
    updated_at timestamp
);


