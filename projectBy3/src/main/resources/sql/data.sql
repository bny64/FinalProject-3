insert into users(USER_NO,USER_ID,PASSWORD,NICKNAME,USER_NAME,TEL,EMAIL,BIRTHDATE)
VALUES(USER_NO_SEQ.NEXTVAL,'hong','1234','hhh','kildong','010-4137-9919','eungoo1241@naver.com',sysdate);
insert into users(USER_NO,USER_ID,PASSWORD,NICKNAME,USER_NAME,TEL,EMAIL,BIRTHDATE)
VALUES(USER_NO_SEQ.NEXTVAL,'lee','1234','min','minkuk','010-4137-8888','minkuk@naver.com',sysdate);
insert into users(USER_NO,USER_ID,PASSWORD,NICKNAME,USER_NAME,TEL,EMAIL,BIRTHDATE)
VALUES(USER_NO_SEQ.NEXTVAL,'ba','1234','nam','namy','010-7898-8888','kkk@naver.com',sysdate);


insert into USER_LOCATION VALUES(user_location_no_seq.NEXTVAL,sysdate,36.815129,127.11389389,2);
insert into USER_LOCATION VALUES(user_location_no_seq.NEXTVAL,sysdate,36.855139,127.21389389,3);
insert into USER_LOCATION VALUES(user_location_no_seq.NEXTVAL,sysdate,36.115129,127.91389389,4);


insert into category VALUES(category_no_seq.NEXTVAL,'computer');
insert into category VALUES(category_no_seq.NEXTVAL,'study');
insert into category VALUES(category_no_seq.NEXTVAL,'food');

insert into BOARD VALUES(board_no_seq.NEXTVAL,'title:sample data',1,'this is sparta',sysdate,2,1);
insert into BOARD VALUES(board_no_seq.NEXTVAL,'title:sample data2',1,'this is sparta',sysdate,2,1);
insert into BOARD VALUES(board_no_seq.NEXTVAL,'title:sample data3',1,'this is sparta',sysdate,2,1);

insert into BOARD_LOCATION VALUES(board_location_no_seq.nextval,36.115129,127.91389389,1);

insert into USER_CATEGORY VALUES(1,1,2);





