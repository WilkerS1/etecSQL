use master						--disuse master
drop database		bancho		--delete bancho
create database		bancho		--recreate bancho*
use					bancho		--use bancho
go								--go to bancho
/*
	*Bancho is a reference to the name of the official Osu! servers
*/


/* table creation */
create table tb_clients (
	id_client				int			primary key		identity(0,1), --identity(int stating_point, int increment)
	client_name				varchar(32)	 null,
	client_address			varchar(127) null,
	client_phone			int			 null,
	client_email			varchar(32)	 null,
)

create table tb_listitems (
	id_item					int			primary key		identity(0,1),
	item_desc				text		 null,
	item_price				float		 null,
	item_unitqtd			int			 null,
)

create table tb_sell_checkouts (
	id_checkout				int			primary key		identity(0,1),
	id_client				int,
	checkout_date			int,
	checkout_value_total	float,
	checkout_value_discount	float,
	checkout_value_paid		float,
)

create table tb_sell_checkouts_items (
	id_checkout_item		int			primary key		identity(0,1),
	id_checkout				int,
	id_item					int,
	checkout_item_qtd		int,
	checkout_item_value		float,
)


/* table rules creation */
alter table tb_sell_checkouts			--alter in tb_sell_checkouts
	
	add constraint tbr_sync_client_id		--add a rule called "tbr_sync_client_id"
											--where
		foreign key	(id_client)				--the column "id_client"
		references	tb_clients(id_client)	--refers to "id_client" in "tb_clients"


alter table tb_sell_checkouts_items
	
	add constraint tbr_sync_id_checkout 
		
		foreign key	(id_checkout)
		references	tb_sell_checkouts(id_checkout)

alter table tb_sell_checkouts_items
	
	add constraint tbr_sync_id_item
		
		foreign key	(id_item)
		references	tb_listitems(id_item)
		

/* insert values into a table :3 */
insert into tb_clients(client_name)	--at client_name in tb_clients,
	values('dummy')					--create "dummy"

insert into tb_sell_checkouts(id_client) --at id_client in tb_sell_checkouts,
	values(0)							 --create a sell registry refering to "dummy"
	
	
	
insert into tb_listitems(item_desc,item_price,item_unitqtd)	--at table(column0,column1,[...])
	values('gpu',499.99,30000)								--values(c0-val,c1-val,[...])
insert into tb_listitems(item_desc,item_price,item_unitqtd)
	values('cpu',299.70,290)
insert into tb_listitems(item_desc,item_price,item_unitqtd)
	values('eee',600.90,2990)


insert into tb_clients(client_name,client_address,client_phone,client_email)
	values('informed dummy','somewhere else','727272','address0@host.com')	 
insert into tb_clients(client_name,client_address,client_phone,client_email)
	values('asdfa','some place','232323','address1@host.com')
insert into tb_clients(client_name,client_address,client_phone,client_email)
	values('haah','a house','898989','address2@host.com')
	

insert into tb_sell_checkouts_items(id_checkout,id_item,checkout_item_qtd,checkout_item_value)
	values(0,0,3,1301)
insert into tb_sell_checkouts_items(id_checkout,id_item,checkout_item_qtd,checkout_item_value)
	values(0,1,5,564)

insert into tb_sell_checkouts(id_client,checkout_date,checkout_value_paid,/**/checkout_value_total)
	values(1,0,12,12)
insert into tb_sell_checkouts(id_client,checkout_date,checkout_value_paid,/**/checkout_value_total)
	values(3,31,9999,9999)


/* reading values from a table :3c */
select * from tb_clients			--select everything (*) from tb_clients
select * from tb_listitems
select * from tb_sell_checkouts


select client_name,client_phone		from tb_clients									--select client_name and client_phone, in this order to show
select client_name					from tb_clients order by	id_client desc			--order by ID in decrescent order
select *							from tb_clients where		client_name like '%m%'		--"like" looks for condicions. % works like * thus selecting everything
select *							from tb_clients where		client_phone < 300000		--only registries where the number in client_phone is lower than 300000


/* join examples */
select * 
	from	tb_clients			as C
	join	tb_sell_checkouts	as V
			on	C.id_client = id_checkout

select C.client_name, C.client_address, S.checkout_date, S.checkout_value_paid
	from	tb_clients			as C
	join	tb_sell_checkouts	as S
			on C.id_client = S.id_checkout				

