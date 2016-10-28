insert into users(USER_NO,USER_ID,PASSWORD,NICKNAME,USER_NAME,TEL,EMAIL,BIRTHDATE)
VALUES(USER_NO_SEQ.NEXTVAL,'hong','1234','hhh','kildong','010-4137-9919','eungoo1241@naver.com',sysdate);
insert into users(USER_NO,USER_ID,PASSWORD,NICKNAME,USER_NAME,TEL,EMAIL,BIRTHDATE)
VALUES(USER_NO_SEQ.NEXTVAL,'lee','1234','min','minkuk','010-4137-8888','minkuk@naver.com',sysdate);
insert into users(USER_NO,USER_ID,PASSWORD,NICKNAME,USER_NAME,TEL,EMAIL,BIRTHDATE)
VALUES(USER_NO_SEQ.NEXTVAL,'ba','1234','nam','namy','010-7898-8888','kkk@naver.com',sysdate);


insert into USER_LOCATION VALUES(user_location_no_seq.NEXTVAL,'location1',sysdate,36.815129,127.11389389,2);
insert into USER_LOCATION VALUES(user_location_no_seq.NEXTVAL,'location2',sysdate,36.855139,127.21389389,3);


insert into category VALUES(category_no_seq.NEXTVAL,'computer');
insert into category VALUES(category_no_seq.NEXTVAL,'study');
insert into category VALUES(category_no_seq.NEXTVAL,'food');

insert into BOARD VALUES(board_no_seq.NEXTVAL,'sample data',1,'this is sparta',sysdate,2,1,'');
insert into BOARD VALUES(board_no_seq.NEXTVAL,'sample data2',1,'this is sparta',sysdate,2,1,'');
insert into BOARD VALUES(board_no_seq.NEXTVAL,'sample data3',1,'this is sparta',sysdate,2,1,'');

insert into BOARD_LOCATION VALUES(board_location_no_seq.nextval,36.115129,127.91389389,1);

insert into USER_CATEGORY VALUES(1,1,2);

insert into user_friend values(friend_list_no_seq.nextval, 2, 'sleep', 2, 'on');
insert into user_friend values(friend_list_no_seq.nextval, 3, 'work', 2, 'off');
insert into user_friend values(friend_list_no_seq.nextval, 1, 'cycle', 2, 'off');

insert into promise
values(promise_no_seq.NEXTVAL, '밥 먹자11', 1, 2, sysdate, 100.0, 200.0, '빨리빨리111', '약속 완료');

insert into promise
values(promise_no_seq.NEXTVAL, '밥 먹자22', 2, 3, sysdate, 100.0, 200.0, '빨리빨리222', '약속 중');

insert into promise
values(promise_no_seq.NEXTVAL, '밥 먹자33', 2, 1, sysdate, 100.0, 200.0, '빨리빨리333', '약속 중');

insert into promise
values(promise_no_seq.NEXTVAL, '밥 먹자44', 3, 1, sysdate, 100.0, 200.0, '빨리빨리444', '약속 완료');

