CREATE TABLE Board(    bno    NUMBER NOT NULL,    title    VARCHAR2(200) NOT NULL,    content    CLOB NOT NULL,    dates    DATE NOT NULL,    views   NUMBER DEFAULT 0 NOT NULL,    del    CHAR(1) DEFAULT 'n' NOT NULL,    types    NUMBER NOT NULL);-- types 1 : news, 2 : notice -- clob : 4000자 이상 사용 가능select * from board;ALTER TABLE Board ADD CONSTRAINT board_bno_PK PRIMARY KEY ( bno );CREATE TABLE Chat(    cno    NUMBER NOT NULL,    mno    NUMBER NOT NULL,    content    VARCHAR2(500) NOT NULL,    dates    DATE NOT NULL);ALTER TABLE Chat ADD CONSTRAINT chat_con_PK PRIMARY KEY ( cno );CREATE TABLE Coin(    cno    NUMBER NOT NULL,    name    VARCHAR2(100) NOT NULL,    code    VARCHAR2(20) NOT NULL);ALTER TABLE Coin ADD CONSTRAINT coin_cno_PK PRIMARY KEY ( cno );CREATE TABLE FavoriteCoin(    fc_no    NUMBER NOT NULL,    mno    NUMBER NOT NULL,    cno    NUMBER NOT NULL);ALTER TABLE FavoriteCoin ADD CONSTRAINT favoritecoin_fc_no_PK PRIMARY KEY ( fc_no );CREATE TABLE FavoriteStock(    fs_no    NUMBER NOT NULL,    sno    NUMBER NOT NULL,    mno    NUMBER NOT NULL);ALTER TABLE FavoriteStock ADD CONSTRAINT favoritestock_fs_no_PK PRIMARY KEY ( fs_no );drop table member; CREATE TABLE Member(    mno    NUMBER NOT NULL,    id    VARCHAR2(100) NOT NULL,    nick    VARCHAR2(40) NOT NULL,    reg_date    DATE NOT NULL,    del    CHAR(1) default 'n');select * from member;delete from member;ALTER TABLE Member ADD CONSTRAINT member_mno_PK PRIMARY KEY ( mno );CREATE TABLE MyCoin(    mcno    NUMBER NOT NULL,    cno    NUMBER NOT NULL,    mno    NUMBER NOT NULL,    cnt    NUMBER NOT NULL,    avgPrice    FLOAT NOT NULL);ALTER TABLE MyCoin ADD CONSTRAINT mycoin_mcno_PK PRIMARY KEY ( mcno );CREATE TABLE Qna(    qno    NUMBER NOT NULL,    title    VARCHAR2(200) NOT NULL,    content    VARCHAR2(2000) NOT NULL,    dates    DATE NOT NULL,    secret    CHAR(1) DEFAULT 'n' NOT NULL,    del    CHAR(1) DEFAULT 'n' NOT NULL,    mno    NUMBER NOT NULL);ALTER TABLE Qna ADD CONSTRAINT qna_qno_PK PRIMARY KEY ( qno );alter table qna drop column del;delete from qna;select * from qna;CREATE TABLE QnaReply(    qr_no    NUMBER NOT NULL,    qno    NUMBER NOT NULL,    content    VARCHAR2(500) NOT NULL,    dates    DATE NOT NULL);ALTER TABLE QnaReply ADD CONSTRAINT QnaReply_qr_no_PK PRIMARY KEY ( qr_no ); CREATE TABLE Reply(    bno    NUMBER NOT NULL,    rno    NUMBER NOT NULL,    content    VARCHAR2(500) NOT NULL,    dates    DATE NOT NULL,    del    CHAR(1) DEFAULT 'n' NOT NULL,    mno    NUMBER NOT NULL,    likes    NUMBER DEFAULT 0 NOT NULL);ALTER TABLE Reply ADD CONSTRAINT reply_rno_PK PRIMARY KEY ( bno,rno );select * from reply;delete from reply where mno = 0;CREATE TABLE ReplyLikes(    mno    NUMBER NOT NULL,    bno    NUMBER NOT NULL,    rno    NUMBER NOT NULL);CREATE TABLE Stock(    sno    NUMBER NOT NULL,    name    VARCHAR2(100) NOT NULL,    code    VARCHAR2(20) NOT NULL);ALTER TABLE Stock ADD CONSTRAINT stock_sno_PK PRIMARY KEY ( sno );CREATE TABLE TradeList(    tno    NUMBER NOT NULL,    cno    NUMBER NOT NULL,    mno    NUMBER NOT NULL,    cnt    NUMBER NOT NULL,    price    FLOAT NOT NULL,    dates    DATE NOT NULL,    types    NUMBER NOT NULL);select * from ADMIN;CREATE TABLE Admin (	id varchar2(20) not null,	pwd varchar2(20) not null);insert into admin values('admin', '1234');ALTER TABLE TradeList ADD CONSTRAINT tradelist_tno_PK PRIMARY KEY ( tno );