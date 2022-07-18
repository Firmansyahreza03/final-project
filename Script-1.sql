CREATE TABLE comm_file (
	id varchar(36),
	file_name text,
	file_extension text,
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_file add constraint file_pk primary key (id);

create table comm_payment_transaction(
	id varchar(36),
	file_id varchar(36),
	is_acc boolean,
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_payment_transaction add constraint payment_pk primary key(id);
alter table comm_payment_transaction add constraint payment_file_fk foreign key(file_id) references comm_file(id);

CREATE TABLE comm_role(
	id varchar(36),
	role_name text,
	role_code text,
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_role add constraint role_pk primary key (id);
alter table comm_role add constraint role_code_bk unique(role_code);

create table comm_balance(
	id varchar(36),
	balance int,
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_balance add constraint balance_pk primary key (id);

create table comm_subscription_status(
	id varchar(36),
	is_subscriber boolean,
	payment_id varchar(36),
	expired_at timestamp,
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_subscription_status add constraint subscription_status_pk primary key(id);
alter table comm_subscription_status add constraint subscription_status_payment_fk foreign key(payment_id) references comm_payment_transaction(id);

CREATE TABLE comm_user(
	id varchar(36),
	user_email text,
	user_password text,
	subscription_status_id varchar(36),
	verfication_code text,
	role_id varchar(36),
	file_id varchar(36),
	balance_id varchar(36),
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_user add constraint user_pk primary key (id);
alter table comm_user add constraint email_bk unique (user_email);

ALTER table comm_user add constraint usr_role_fk foreign key(role_id) references comm_role(id);
ALTER table comm_user add constraint usr_balance_fk foreign key(balance_id) references comm_balance(id);
ALTER table comm_user add constraint usr_file_fk foreign key(file_id) references comm_file(id);
alter table comm_user add constraint usr_subs_fk foreign key(subscription_status_id) references comm_subscription_status(id);

CREATE TABLE comm_industry(
	id varchar(36),
	industry_name text,
	industry_code text,
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_industry add constraint industry_pk primary key (id);
alter table comm_industry add constraint industry_code_bk unique(industry_code);

CREATE TABLE comm_profile(
	id varchar(36),
	full_name text,
	company_name text,
	position_name text,
	industry_id varchar(36),
	user_id varchar(36),
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_profile add constraint profile_pk primary key (id);

ALTER table comm_profile add constraint industry_profile_fk foreign key(industry_id) references comm_industry(id);
ALTER table comm_profile add constraint user_profile_fk foreign key(user_id) references comm_user(id);

create table comm_forum_hdr(
	id varchar(36),
	forum_title text,
	forum_code text,
	file_id varchar(36),
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_forum_hdr add constraint forum_hdr_pk primary key (id);
alter table comm_forum_hdr add constraint forum_code_bk unique(forum_code);

ALTER table comm_forum_hdr add constraint forum_file_fk foreign key(file_id) references comm_file(id);

create table comm_forum_dtl(
	id varchar(36),
	chat text,
	header_id varchar(36),
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_forum_dtl add constraint forum_dtl_pk primary key (id);
ALTER table comm_forum_dtl add constraint forim_dtl_fk foreign key(header_id) references comm_forum_hdr(id);

create table comm_community_category(
	id varchar(36),
	category_name text,
	category_code text,
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_community_category add constraint community_category_pk primary key (id);
alter table comm_community_category add constraint community_category_code_bk unique(category_code);

create table comm_community(
	id varchar(36),
	community_title text,
	community_provider text,
	community_location text,
	community_start_at timestamp,
	community_end_at timestamp,
	community_desc text,
	community_code text,
	community_price int,
	file_id varchar(36),
	category_id varchar(36),
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_community add constraint community_pk primary key (id);
alter table comm_community add constraint community_code_bk unique(community_code);

ALTER table comm_community add constraint comunity_file_fk foreign key(file_id) references comm_file(id);
ALTER table comm_community add constraint forim_dtl_fk foreign key(category_id) references comm_community_category(id);

create table comm_thread_category(
	id varchar(36),
	category_name text,
	category_code text,
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_thread_category add constraint thread_category_pk primary key (id);
alter table comm_thread_category add constraint thread_category_code_bk unique(category_code);

create table comm_polling_hdr(
	id varchar(36),
	polling_name text,
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_polling_hdr add constraint polling_hdr_pk primary key (id);

create table comm_polling_option(
	id varchar(36),
	polling_hdr varchar(36),
	option_name text,
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_polling_option add constraint polling_opt_pk primary key (id);

ALTER table comm_polling_option add constraint comm_polling_option_fk foreign key(polling_hdr) references comm_polling_hdr(id);

create table comm_polling_answer(
	id varchar(36),
	option_id varchar(36),
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_polling_answer add constraint polling_answer_pk primary key (id);
ALTER table comm_polling_answer add constraint comm_polling_answer_fk foreign key(option_id) references comm_polling_option(id);

create table comm_thread_hdr(
	id varchar(36),
	thread_name text,
	thread_code text,
	is_premium boolean,
	thread_price int,
	polling_id varchar(36),
	category_id varchar(36),
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_thread_hdr add constraint thread_hdr_pk primary key(id);
alter table comm_thread_hdr add constraint thread_code_bk unique(thread_code);

ALTER table comm_thread_hdr add constraint comm_thread_hdr_polling_fk foreign key(polling_id) references comm_polling_hdr(id);
ALTER table comm_thread_hdr add constraint comm_thread_hdr_category_fk foreign key(category_id) references comm_thread_category(id);

create table comm_thread_dtl(
	id varchar(36),
	thread_comment text,
	user_id varchar(36),
	is_liked boolean,
	hdr_id varchar(36),
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_thread_dtl add constraint thread_dtl_pk primary key(id);

ALTER table comm_thread_dtl add constraint comm_thread_dtl_fk foreign key(hdr_id) references comm_thread_hdr(id);
ALTER table comm_thread_dtl add constraint comm_thread_dtl_user_fk foreign key(user_id) references comm_user(id);

create table comm_member_community(
	id varchar(36),
	user_id varchar(36),
	community_id varchar(36),
	payment_id varchar(36),
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_member_community add constraint member_community_pk primary key (id);
ALTER table comm_member_community add constraint comm_member_community_fk foreign key(community_id) references comm_community(id);
ALTER table comm_member_community add constraint comm_member_community_user_fk foreign key(user_id) references comm_user(id);
alter table comm_member_community add constraint comm_member_community_payment_fk foreign key(payment_id) references comm_payment_transaction(id);

create table comm_bookmark(
	id varchar(36),
	thread_hdr_id varchar(36),
	user_id varchar(36),
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_bookmark add constraint bookmark_pk primary key(id);
ALTER table comm_bookmark add constraint comm_bookmark_fk foreign key(thread_hdr_id) references comm_thread_dtl(id);
ALTER table comm_bookmark add constraint comm_bookmark_user_fk foreign key(user_id) references comm_user(id);

create table comm_article(
	id varchar(36),
	article_title text,
	article_content text,
	user_id varchar(36),
	
	created_by varchar(36),
	created_at timestamp,
	updated_by varchar(36),
	updated_at timestamp,
	is_active boolean,
	"version" int
);

alter table comm_article add constraint article_pk primary key(id);
alter table comm_article add constraint article_user_fk foreign key(user_id) references comm_user(id);