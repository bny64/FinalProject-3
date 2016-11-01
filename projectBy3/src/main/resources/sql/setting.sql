create TABLE admin(
admin_id varchar2(20) not null,
password varchar2(20) not null, 
constraint admin_id_pk primary key (admin_id)
);

create table users(
user_no number not null,
user_id varchar2(20) not null,
password varchar2(20) not null,
nickname varchar2(20) not null,
user_name varchar2(20) not null,
tel varchar2(20),
email varchar2(30),
birthdate date,
constraint user_no_pk primary key (user_no),
constraint user_id_u unique (user_id),
constraint user_nickname_u unique (nickname)
);

create sequence user_no_seq
start with 1 increment by 1;

create table user_location(
  user_location_no number not null,
  location_name varchar2(20) not null,
  register_date date not null,
  latitude float not null,
  longitude float not null,
  user_no number not null,
  constraint user_location_no_pk primary key (user_location_no)
);

alter table user_location add constraint user_no_fk 
foreign key (user_no) references users (user_no) on delete cascade;

create sequence user_location_no_seq
start with 1 increment by 1;

create table user_friend(
  list_no number not null,
  friend_no number not null,
  statue varchar2(20) not null,
  user_no number not null,
  constraint list_no_pk primary key(list_no)
);

create sequence friend_list_no_seq
start with 1 increment by 1;

alter table user_friend add constraint user_no_fk2
foreign key (user_no) references users (user_no) on delete cascade;

create table category(
  category_no number not null,
  category_name varchar2(20) not null,
  constraint category_no_pk primary key (category_no)
);

create sequence category_no_seq
start with 1 increment by 1;

create table board(
  board_no number not null,
  title varchar2(20) not null,
  hit number,
  content varchar2(500),
  writed_date date not null,
  user_no number not null,
  category_no number not null,
  constraint board_no_pk primary key (board_no)
);

alter table board add constraint user_no_fk3 foreign key (user_no) references users (user_no)on delete cascade;
alter table board add constraint category_no_fk foreign key (category_no) references category (category_no);

create sequence board_no_seq
start with 1 increment by 1;

create table board_location(
  board_location_no number not null,
  latitude float not null,
  longitude float not null,
  board_no number not null,
  constraint board_location_no_pk primary key (board_location_no)
);

alter table board_location add constraint board_no_fk 
foreign key (board_no) references board(board_no) on delete cascade;

create sequence board_location_no_seq
start with 1 increment by 1;

create table user_category(
  list_no number not null,
  category_no number not null,
  user_no number not null
);

alter table user_category add constraint category_no_fk2 foreign key (category_no) references category(category_no);
alter table user_category add constraint user_no_fk4 
foreign key (user_no) references users (user_no) on delete cascade;

create sequence category_list_no_seq
start with 1 increment by 1;




alter table board add(image_path varchar2(20));

alter table board_location
drop constraint board_no_fk;

alter table board_location
add constraint board_no_fk foreign key(board_no) references board(board_no);

alter table user_friend add alarm varchar2(20) check(alarm in('on','off'));
alter table user_friend modify alarm constraint alarm_nn not null;



create table promise(
  promise_id number not null,
  promise_title varchar2(50) not null,
  promoter number not null,
  invitee number not null,
  promise_date date,
  promise_latitude float not null,
  promise_longitude float not null,
  promise_content varchar2(200),
  promise_status varchar2(20) not null,
  constraint promise_id_pk primary key (promise_id)
);

create sequence promise_no_seq
start with 1 increment by 1;

alter table board add view_status varchar(20) check(view_status in('hidden','visible'));
update board set VIEW_STATUS='visible';
alter table board modify view_status constraint view_status not null;

create table user_history(
  user_no number not null,
  board_no number not null,
  foreign key(user_no) REFERENCES users(user_no) on DELETE CASCADE,
  foreign key(board_no) REFERENCES board(board_no) on DELETE CASCADE
);

alter table board MODIFY (image_path varchar2(200));
alter table users add profile_path varchar(200);
