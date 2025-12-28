
create table telecom_transaction(
id int not null identity (1,1),
Transaction_id int not null,
IMSI varchar(9) not null,
subscriber_id int ,
TAC varchar(8) not null,
SNR varchar(6),
IMEI varchar(14),
CELL int not null,
LAC int not null,
EVENT_TYPE varchar(1) null,
EVENT_TS datetime not null,
constraint pk_fact_transaction_id primary key (id)
)

create table Erroe_telecom_transaction(
    id int,
    imsi varchar(9),
    imei varchar(14),
    cell int,
    lac int,
    event_type varchar(1),
    event_ts datetime,
	tac varchar(8),
	snr varchar(8),
    ErrorCode int,
    ErrorColumn int
)


