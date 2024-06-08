use muhan;
create table user_info (
                           user_seqno int primary key auto_increment,
                           user_num int not null unique,
                           user_pw varchar(50) not null default 12345678,
                           user_dept int not null,
                           user_level int not null,
                           user_in_date varchar(30) not null,
                           user_name varchar(30) not null,
                           user_phone varchar(50) not null,
                           user_addr varchar(255) not null,
                           user_email varchar(100) not null,
                           user_birth varchar(30) not null,
                           user_photo text,
                           user_reg_date date not null,
                           user_out int not null default 1,
                           user_out_date date,
                           user_work_date int not null default 0
);

create table event_photo (
                             photo_seq int primary key auto_increment,
                             photo_uploader int not null,
                             photo_new_name varchar(255) not null,
                             photo_reg_date date not null,
                             photo_title varchar(50) not null
);

create table attend (
                        att_seq int primary key auto_increment,
                        att_user int not null,
                        att_start datetime not null default now(),
                        att_end datetime,
                        att_chk int,
                        att_reg_date datetime not null
);

create table worktime (
                          wk_seq int primary key auto_increment,
                          wk_availtime int default 40
);

create table board(
                      board_seq int primary key auto_increment,
                      board_class int not null,
                      board_title varchar(255) not null,
                      board_contents text not null,
                      board_file text,
                      board_ori_file text,
                      board_date datetime not null default now(),
                      board_writer int not null default 1,
                      board_view_count int default 0
);

create table comments (
                          com_seq int primary key auto_increment,
                          com_board_num int not null,
                          com_comment text not null,
                          com_commenter int not null,
                          com_reg_date datetime not null default now()
);

create table schedules (
                           sche_seq int primary key auto_increment,
                           sche_writer int not null,
                           sche_start_time varchar(50),
                           sche_end_time varchar(50),
                           sche_title varchar(30) not null,
                           sche_contents text,
                           sche_color varchar(30),
                           sche_reg_date date not null
);

create table meetingroom (
                             meet_seq int primary key auto_increment,
                             meet_room varchar(50) not null
);

create table meetingtime (
                             mtime_seq int primary key auto_increment,
                             mtime_time varchar(50) not null
);

create table m_reserve (
                           mr_seq int primary key auto_increment,
                           mr_user int not null,
                           mr_date date not null,
                           mr_room int not null,
                           mr_time int not null,
                           mr_reg_date datetime not null default now()
);

create table dept (
                      dept_seq int primary key auto_increment,
                      dept_name varchar(30) not null,
                      dept_code int not null,
                      dept_nick varchar(50) not null
);

create table levels (
                        level_seq int primary key auto_increment,
                        level_name varchar(30) not null,
                        level_code int not null
);

create table approval(
                         apr_seq        int primary key auto_increment,
                         apr_writer     int not null,
                         apr_upper      int not null,
                         apr_title      varchar(50) not null,
                         apr_contents   text,
                         apr_attach     text,
                         apr_ori_attach text,
                         apr_u_time     date not null,
                         apr_p_time     date,
                         apr_chk        int not null default 0,
                         apr_reg_date   date not null
);


insert dept(dept_name, dept_code,dept_nick) values ('오너', 0, 'CEO');
insert dept(dept_name, dept_code,dept_nick) values ('총무부', 1, 'DON');
insert dept(dept_name, dept_code,dept_nick) values ('인사과', 2, 'HR');
insert dept(dept_name, dept_code,dept_nick) values ('기획팀', 3, 'PLAN');
insert dept(dept_name, dept_code,dept_nick) values ('개발부', 4, 'JAVA');
insert dept(dept_name, dept_code,dept_nick) values ('영업팀', 5, 'SALE');
insert dept(dept_name, dept_code,dept_nick) values ('경영지원', 6, 'HELP');
insert dept(dept_name, dept_code,dept_nick) values ('영업지원', 7, 'SUP');
insert dept(dept_name, dept_code,dept_nick) values ('품질관리', 8, 'QC');
insert dept(dept_name, dept_code,dept_nick) values ('생산부', 9, 'NGD');
insert dept(dept_name, dept_code,dept_nick) values ('R&D', 10, 'RD');
insert dept(dept_name, dept_code,dept_nick) values ('관리부', 11, 'MG');

insert  into levels(level_code, level_name) values (00 ,'사장');
insert  into levels(level_code, level_name) values (01 ,'부사장');
insert  into levels(level_code, level_name) values (02 ,'전무');
insert  into levels(level_code, level_name) values (03 ,'이사');
insert  into levels(level_code, level_name) values (04 ,'부장');
insert  into levels(level_code, level_name) values (05 ,'차장');
insert  into levels(level_code, level_name) values (06 ,'과장');
insert  into levels(level_code, level_name) values (07 ,'대리');
insert  into levels(level_code, level_name) values (08 ,'주임');
insert  into levels(level_code, level_name) values (09 ,'사원');

insert into meetingtime value (null,'09:00');
insert into meetingtime value (null,'10:00');
insert into meetingtime value (null,'11:00');
insert into meetingtime value (null,'12:00');
insert into meetingtime value (null,'13:00');
insert into meetingtime value (null,'14:00');
insert into meetingtime value (null,'15:00');
insert into meetingtime value (null,'16:00');
insert into meetingtime value (null,'17:00');
insert into meetingtime value (null,'18:00');

insert into worktime values (null,52);
insert into worktime values (null,40);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10000, 12, 3, '2020-05-02', '관리자1', '010-2222-2222', '서울특별시 강남구 테헤란로 14길 6 남도빌딩', '10000@muhan.com', '1978-05-05', now(), 1);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10001, 12, 4, '2021-08-15', '관리자2', '010-2582-3845', '서울특별시 강남구 테헤란로 14길 6 남도빌딩', '10001@muhan.com', '1991-12-11', now(), 1);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10002, 1, 1, '2020-05-02', '이석철', '010-7437-6873', '경기도 과천시 별양로 12', '10002@muhan.com', '1968-08-18', now(), 1);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10003, 5, 3, '2020-10-18', '안준성', '010-9876-1357', '경기도 안양시 만안구 경수대로1200번길', '10003@muhan.com', '1975-12-08', now(), 1);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10004, 5, 4, '2020-08-27', '이순기', '010-7693-2712', '경기 부천시 원미구 장말로 71', '10004@muhan.com', '1975-03-15', now(), 1);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10005, 5, 5, '2020-12-13', '장발장', '010-1324-0978', '서울 관악구 신림로29길 8', '10005@muhan.com', '1979-01-24', now(), 1);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10006, 5, 6, '2020-09-07', '인순이', '010-5691-2134', '서울 동작구 만양로 26 건양아파트', '10006@muhan.com', '1980-05-15', now(), 1);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10007, 5, 7, '2020-11-25', '홍창기', '010-8903-1462', '서울 동작구 사당로 90', '10007@muhan.com', '1976-12-15', now(), 1);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10008, 5, 8, '2020-10-28', '고우석', '010-5618-2536', '경기 용인시 기흥구 사은로126번길 10', '10008@muhan.com', '1979-03-04', now(), 1);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10009, 5, 9, '2020-11-25', '임찬규', '010-3829-4586', '경기 성남시 분당구 동판교로 275', '10009@muhan.com', '1982-08-16', now(), 1);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10010, 5, 10, '2022-08-12', '김민정', '010-5618-2536', '서울 금천구 가산로 99', '10010@muhan.com', '1984-01-01', now(), 1);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10011, 5, 10, '2022-03-17', '김민수', '010-8212-1840', '서울 관악구 남부순환로198길 7', '10011@muhan.com', '1980-03-10', now(), 1);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10012, 6, 7, '2022-10-17', '김민희', '010-8456-0886', '경기도 수원시 권선구 권중로 82', '10012@muhan.com', '1996-10-14', now(), 1);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10013, 3, 7, '2022-12-08', '구혜민', '010-4596-2865', '경기도 안양시 동안구 동안로 70', '10013@muhan.com', '1995-02-03', now(), 1);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10014, 4, 7, '2022-08-12', '강경은', '010-8763-7692', '서울 서초구 잠원로 37-48', '10014@muhan.com', '1997-08-14', now(), 1);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10015, 2, 7, '2022-09-19', '이영규', '010-4585-5762', '서울 서초구 서초대로 385', '10015@muhan.com', '1993-11-07', now(), 1);

insert into user_info(user_num, user_dept, user_level, user_in_date, user_name, user_phone, user_addr, user_email, user_birth, user_reg_date, user_work_date) values (10016, 11, 7, '2022-06-20', '박서영', '010-5765-7462', '서울 서초구 효령로 391', '10016@muhan.com', '1999-04-12', now(), 1);


insert into board (board_class, board_title, board_contents, board_file, board_ori_file) values
    (0, '공지 글쓰기 테스트 제목입니다.', '공지 글쓰기 테스트 내용입니다.', '17175472477751.jpg', '1.jpg');
insert into board (board_class, board_title, board_contents, board_file, board_ori_file) values
    (1, '공지 글쓰기 테스트 제목 2 입니다.', '공지 글쓰기 테스트 내용 2 입니다.', '1717547272375heart1.png', 'heart1.png');
insert into board (board_class, board_title, board_contents, board_file, board_ori_file) values
    (0, '세번째 제목입니다.', '세번째 내용입니다다다다다', '17175473085461.jpg', '1.jpg');
insert into board (board_class, board_title, board_contents) values (2, '랄라라라라4444', '네번째 내용이빈다.');
insert into board (board_class, board_title, board_contents) values (2, '그런데 이거 날짜 포맷 바뀌는 거
어떻게 보여주죠', '모르겠다 나중에 업데이트로 바꿔야지');
insert into board (board_class, board_title, board_contents) values (0, '몇 번재 글인지 모르겠어요', '음
모르겠다');
insert into board (board_class, board_title, board_contents) values (1, '열 개까지 적어서 긁어야지', '으으으음');
insert into board (board_class, board_title, board_contents) values (0, '열 개까지 몇 개 남았을까요',
                                                                     '흠흠ㅁ흠흠');
insert into board (board_class, board_title, board_contents) values (0, '두 개만 더 하면 된다', '두두두두두두두두두두두두두개');
insert into board (board_class, board_title, board_contents) values (1, '이것은 인풋타입텍스트입니다', '이것은
텍스트에리어입닏.');


insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'1.webp', '야유회사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'2.jpg', '야유회사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'3.jpg', '회의사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'4.jpg', '회의사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'5.jpg', '회의사진3', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'1.webp', '야유회사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'2.jpg', '야유회사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'3.jpg', '회의사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'4.jpg', '회의사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'5.jpg', '회의사진3', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'1.webp', '야유회사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'2.jpg', '야유회사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'3.jpg', '회의사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'4.jpg', '회의사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'5.jpg', '회의사진3', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'1.webp', '야유회사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'2.jpg', '야유회사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'3.jpg', '회의사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'4.jpg', '회의사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'5.jpg', '회의사진3', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'1.webp', '야유회사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'2.jpg', '야유회사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'3.jpg', '회의사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'4.jpg', '회의사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'5.jpg', '회의사진3', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'1.webp', '야유회사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'2.jpg', '야유회사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'3.jpg', '회의사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'4.jpg', '회의사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'5.jpg', '회의사진3', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'1.webp', '야유회사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'2.jpg', '야유회사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'3.jpg', '회의사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'4.jpg', '회의사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'5.jpg', '회의사진3', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10000 ,'1.webp', '야유회사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'2.jpg', '야유회사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'3.jpg', '회의사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'4.jpg', '회의사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'5.jpg', '회의사진3', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'1.webp', '야유회사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'2.jpg', '야유회사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'3.jpg', '회의사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'4.jpg', '회의사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'5.jpg', '회의사진3', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'1.webp', '야유회사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'2.jpg', '야유회사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'3.jpg', '회의사진1', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'4.jpg', '회의사진2', '2024-05-30');
insert  into event_photo(photo_uploader, photo_new_name, photo_title, photo_reg_date) values (10001 ,'5.jpg', '회의사진3', '2024-05-30');


insert into approval(apr_writer, apr_upper, apr_title, apr_contents, apr_attach, apr_ori_attach, apr_u_time, apr_chk,
                     apr_reg_date) values (10011, 10005, '연차 결재 올립니다', '6월 11일 건강검진 예약으로 연차 올립니다. 결재 부탁드립니다.', NULL, NULL, now(), 0, now());

insert into approval(apr_writer, apr_upper, apr_title, apr_contents, apr_attach, apr_ori_attach, apr_u_time, apr_chk,
                     apr_reg_date) values (10011, 10005, '출장 결재 올립니다', '승인 부탁드립니다.', NULL, NULL, now(), 0, now());

insert into approval(apr_writer, apr_upper, apr_title, apr_contents, apr_attach, apr_ori_attach, apr_u_time, apr_chk,
                     apr_reg_date) values (10011, 10005, '부서 점심 회식 결재 올립니다', '결재 부탁드립니다.', NULL, NULL, now(), 0, now());

insert into approval(apr_writer, apr_upper, apr_title, apr_contents, apr_attach, apr_ori_attach, apr_u_time, apr_chk,
apr_reg_date) values (10011, 10008, '결재 올립니다', '감사합니다.', NULL, NULL, now(), 0, now());

insert into approval(apr_writer, apr_upper, apr_title, apr_contents, apr_attach, apr_ori_attach, apr_u_time, apr_chk,
apr_reg_date) values (10011, 10008, '육아휴직 신청서 입니다.', '감사합니다.', NULL, NULL, now(), 0, now());


insert into comments (com_board_num, com_comment, com_commenter) values (9, '댓글 달면
이렇게 올라갑니다.',
                                                                         10000);
insert into comments (com_board_num, com_comment, com_commenter) values (9, '댓글은
어떻게 달려요?',
                                                                         10000);
insert into comments (com_board_num, com_comment, com_commenter) values (9, '사원들은
공지사항 확인했습니다라는
내용만 가능해요! ! 마치 KH학원처럼', 10000);


