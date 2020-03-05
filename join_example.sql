use jpa;
create table Customer(
	customer_id int not NULL unique,
    name varchar(20),
    address varchar(20),
    email varchar(20),
    phone_number varchar(20),
    primary key(customer_id)
);

insert into Customer value(1, 'Jai', 'Sasaram', 'jai@abc.com', '9876543210');
insert into Customer value(2, 'Dimple', 'Sasaram', 'dim@abc.com', '1234567890');
insert into Customer value(3, 'Minku', 'Patna', 'min@abc.com', '9876567890');
insert into Customer value(4, 'Niku', 'Gaya', 'nik@abc.com', '3434212345');

select * from Customer;

create table Orders(
	order_id int NOT NULL UNIQUE,
    order_name varchar(255),
    price float,
    customerId int NOT NULL,
    primary key(order_id),
    foreign key(customerId) references Customer(customer_id)
);

insert into Orders value(1, 'Mi 5', 7999.50, 1);  /* means this is ordered by customer with id = 1 i.e 'Jai' */ 
insert into Orders value(2, 'Hp laptop', 67999, 1); /* means this is ordered by customer with id = 1 i.e 'Jai'(Look jai can orders more that one item)*/
insert into Orders value(3, 'Sony earphine', 999.50, 2); /* means this is ordered by customer with id = 2 i.e 'Dimple' */
insert into Orders value(4, 'Book', 99.50, 2); /* means this is ordered by customer with id = 2 i.e 'Dimple' */


select * from Orders;

/*See with inner join we can join both tables to fetch the columns of both tables at the same*/
select Customer.name, Orders.order_name, Orders.price
from Orders inner join Customer on Customer.customer_id=Orders.customerId;



