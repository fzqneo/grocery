
-- Dimension customer
create table customer (c_cid    integer not null,
                       c_cname  varchar(100) not null,
                       c_gender char(1) not null);

-- Dimension product
create table product (p_pid     integer not null,
                      p_pname   varchar(100) not null,
                      p_quantity    double not null);

-- Fact buy
create table buy    (b_cid      integer not null,
                     b_pid      integer not null,
                     b_amount   integer not null,
                     b_status   char(1) not null);


