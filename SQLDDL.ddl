-- 생성자 Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   위치:        2022-02-13 13:03:16 KST
--   사이트:      Oracle Database 12cR2
--   유형:      Oracle Database 12cR2



CREATE TABLE kathy.actor (
    actor_id        INTEGER NOT NULL,
    actor_name      VARCHAR2(20 BYTE) NOT NULL,
    actor_img_path  VARCHAR2(20 BYTE) NOT NULL
)

COMMENT ON COLUMN kathy.actor.actor_name IS
    '배우 이름';

COMMENT ON COLUMN kathy.actor.actor_img_path IS
    '배우 이미지 경로';

ALTER TABLE kathy.actor ADD CONSTRAINT actor_pk PRIMARY KEY ( actor_id );

----------------------------
CREATE TABLE kathy.add_movie (
    movie_no          INTEGER NOT NULL,
    movie_desc        VARCHAR2(500 BYTE) NOT NULL,
    run_time          INTEGER NOT NULL,
    hit               INTEGER DEFAULT 0 NOT NULL,
    movie_title_en    VARCHAR2(100 BYTE) NOT NULL,
    movie_title_kr    VARCHAR2(100 BYTE) NOT NULL,
    movie_level       INTEGER NOT NULL,
    display_yn        INTEGER NOT NULL,
    movie_genre       VARCHAR2 (100 BYTE) NOT NULL
    movie_nowplaying  INTEGER NOT NULL,
    movie_img1        VARCHAR2 (100 BYTE) NOT NULL
    movie_img2        VARCHAR2 (100 BYTE) NOT NULL
    movie_img3        VARCHAR2 (100 BYTE) NOT NULL
)

PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON COLUMN kathy.add_movie.movie_no IS
    '영화번호';

COMMENT ON COLUMN kathy.add_movie.movie_desc IS
    '영화소개';

COMMENT ON COLUMN kathy.add_movie.run_time IS
    '러닝타임';

COMMENT ON COLUMN kathy.add_movie.hit IS
    '조회수';

COMMENT ON COLUMN kathy.add_movie.movie_title_kr IS
    '영화 제목';

COMMENT ON COLUMN kathy.add_movie.movie_level IS
    '영화등급';

COMMENT ON COLUMN kathy.add_movie.display_yn IS
    '노출여부 Y-0/N-1';

CREATE UNIQUE INDEX kathy.add_movie_pk ON
    kathy.add_movie (
        movie_no
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.add_movie
    ADD CONSTRAINT add_movie_pk PRIMARY KEY ( movie_no )
        USING INDEX kathy.add_movie_pk;


----------------------------
CREATE TABLE kathy.coupon_info (
    coupon_id        INTEGER NOT NULL,
    coupon_img_path  VARCHAR2(50 BYTE) NOT NULL,
    coupon_discount  INTEGER NOT NULL,
    coupon_desc      VARCHAR2(50 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON COLUMN kathy.coupon_info.coupon_id IS
    '쿠폰 번호 ';

COMMENT ON COLUMN kathy.coupon_info.coupon_img_path IS
    '쿠폰 이미지 디렉토리 ';

COMMENT ON COLUMN kathy.coupon_info.coupon_discount IS
    '쿠폰 할인율:';

COMMENT ON COLUMN kathy.coupon_info.coupon_desc IS
    '쿠폰 조건 (상세 내용)';

CREATE UNIQUE INDEX kathy.coupon_info_pk ON
    kathy.coupon_info (
        coupon_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.coupon_info
    ADD CONSTRAINT coupon_info_pk PRIMARY KEY ( coupon_id )
        USING INDEX kathy.coupon_info_pk;
        
        
----------------------------
CREATE TABLE kathy.event (
    event_no         INTEGER NOT NULL,
    event_type       INTEGER NOT NULL,
    event_title      VARCHAR2(50 BYTE) NOT NULL,
    event_desc       VARCHAR2(500 BYTE) NOT NULL,
    event_value      INTEGER NOT NULL,
    event_startdate  DATE NOT NULL,
    event_enddate    VARCHAR2(20 BYTE) NOT NULL,
    event_img        VARCHAR2 (100 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON COLUMN kathy.event.event_no IS
    '이벤트 번호';

COMMENT ON COLUMN kathy.event.event_type IS
    '이벤트 종류';

COMMENT ON COLUMN kathy.event.event_title IS
    '이벤트 제목';

COMMENT ON COLUMN kathy.event.event_desc IS
    '이벤트 내용';

COMMENT ON COLUMN kathy.event.event_value IS
    '당첨 값 ';

COMMENT ON COLUMN kathy.event.event_startdate IS
    '이벤트 시작일';

COMMENT ON COLUMN kathy.event.event_enddate IS
    '이벤트 마감일';

CREATE UNIQUE INDEX kathy.event_pk ON
    kathy.event (
        event_no
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;
ALTER TABLE kathy.event
    ADD CONSTRAINT event_pk PRIMARY KEY ( event_no )
        USING INDEX kathy.event_pk;


----------------------------

CREATE TABLE kathy.hashtag_table (
    hash_id    INTEGER NOT NULL,
    hash_name  VARCHAR2(30) NOT NULL,
    movie_no   INTEGER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON COLUMN kathy.hashtag_table.hash_id IS
    '해쉬태그 ID';

CREATE UNIQUE INDEX kathy.hashtag_table_pk ON
    kathy.hashtag_table (
        hash_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.hashtag_table
    ADD CONSTRAINT hashtag_table_pk PRIMARY KEY ( hash_id )
        USING INDEX kathy.hashtag_table_pk;

CREATE TABLE kathy.location (
    loc_no    INTEGER NOT NULL,
    loc_name  VARCHAR2(20 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX kathy.location_pk ON
    kathy.location (
        loc_no
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.location
    ADD CONSTRAINT location_pk PRIMARY KEY ( loc_no )
        USING INDEX kathy.location_pk;

----------------------------

CREATE TABLE kathy.movie_casting (
    casting_no  INTEGER NOT NULL,
    actor_id    INTEGER NOT NULL,
    movie_no    INTEGER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX kathy.movie_casting_pk ON
    kathy.movie_casting (
        casting_no
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.movie_casting
    ADD CONSTRAINT movie_casting_pk PRIMARY KEY ( casting_no )
        USING INDEX kathy.movie_casting_pk;

----------------------------

CREATE TABLE kathy.movie_like (
    movie_like_id   INTEGER NOT NULL,
    like_startdate  DATE NOT NULL,
    like_enddate    DATE NOT NULL,
    movie_id        INTEGER NOT NULL,
    user_id         VARCHAR2(20) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON COLUMN kathy.movie_like.movie_like_id IS
    '찜하기번호 ';

COMMENT ON COLUMN kathy.movie_like.like_startdate IS
    '찜하기를 누른 날짜 ';

COMMENT ON COLUMN kathy.movie_like.like_enddate IS
    '찜하기 해제 날짜 (누른 날짜 + 7일) ';


----------------------------

CREATE UNIQUE INDEX kathy.movie_like_pk ON
    kathy.movie_like (
        movie_like_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.movie_like
    ADD CONSTRAINT movie_like_pk PRIMARY KEY ( movie_like_id )
        USING INDEX kathy.movie_like_pk;

----------------------------


CREATE TABLE kathy.movie_res_pax (
    movie_res_pax_id  INTEGER NOT NULL,
    schedule_no       INTEGER NOT NULL,
    seats_no_done     INTEGER NOT NULL,
    payment_status    NUMBER
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON COLUMN kathy.movie_res_pax.movie_res_pax_id IS
    '예약번호(고유값)';

----------------------------


CREATE UNIQUE INDEX kathy.reservation_pk ON
    kathy.movie_res_pax (
        movie_res_pax_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.movie_res_pax
    ADD CONSTRAINT reservation_pk PRIMARY KEY ( movie_res_pax_id )
        USING INDEX kathy.reservation_pk;

----------------------------


CREATE TABLE kathy.movie_review (
    review_id     INTEGER NOT NULL,
    review_title  VARCHAR2(50 BYTE) NOT NULL,
    review_desc   VARCHAR2(100 BYTE) NOT NULL,
    review_date   DATE NOT NULL,
    review_grade  INTEGER DEFAULT 0 NOT NULL,
    user_id       VARCHAR2(20) NOT NULL,
    movie_no      INTEGER NOT NULL,
    hit           INTEGER NOT NULL,
    event_no      INTEGER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON COLUMN kathy.movie_review.review_id IS
    '영화 리뷰 번호 ';

COMMENT ON COLUMN kathy.movie_review.review_title IS
    '리뷰 제목';

COMMENT ON COLUMN kathy.movie_review.review_desc IS
    '리뷰 내용 ';

COMMENT ON COLUMN kathy.movie_review.review_date IS
    '리뷰 작성일자 ';

COMMENT ON COLUMN kathy.movie_review.review_grade IS
    '평점컬럼 (1점은 – 1, 2점은 2로 표기)';

----------------------------


CREATE UNIQUE INDEX kathy.movie_review_pk ON
    kathy.movie_review (
        review_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.movie_review
    ADD CONSTRAINT movie_review_pk PRIMARY KEY ( review_id )
        USING INDEX kathy.movie_review_pk;

----------------------------


CREATE TABLE kathy.movie_shedule (
    shedule_no        INTEGER NOT NULL,
    movie_start_time  VARCHAR2(50 BYTE) NOT NULL,
    movie_endtime     VARCHAR2(50 BYTE) NOT NULL,
    theater_id        INTEGER NOT NULL,
    movie_no          INTEGER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON COLUMN kathy.movie_shedule.shedule_no IS
    '영화 스케줄 번호
';

COMMENT ON COLUMN kathy.movie_shedule.movie_start_time IS
    '영화 시작시간';

COMMENT ON COLUMN kathy.movie_shedule.movie_endtime IS
    '영화 종료시간';

----------------------------


CREATE UNIQUE INDEX kathy.movie_shedule_pk ON
    kathy.movie_shedule (
        shedule_no
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.movie_shedule
    ADD CONSTRAINT movie_shedule_pk PRIMARY KEY ( shedule_no )
        USING INDEX kathy.movie_shedule_pk;

CREATE TABLE kathy.my_coupon (
    my_coupon_id      INTEGER NOT NULL,
    coupon_startdate  DATE NOT NULL,
    coupon_enddate    DATE NOT NULL,
    coupon_id         INTEGER NOT NULL,
    user_id           VARCHAR2(20) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON COLUMN kathy.my_coupon.my_coupon_id IS
    '내 쿠폰함 번호';

COMMENT ON COLUMN kathy.my_coupon.coupon_startdate IS
    '쿠폰 사용 시작 날짜';

COMMENT ON COLUMN kathy.my_coupon.coupon_enddate IS
    '쿠폰 사용 종료 날짜';

CREATE UNIQUE INDEX kathy.my_coupon_pk ON
    kathy.my_coupon (
        my_coupon_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.my_coupon
    ADD CONSTRAINT my_coupon_pk PRIMARY KEY ( my_coupon_id )
        USING INDEX kathy.my_coupon_pk;

----------------------------


CREATE TABLE kathy.option_table (
    opt_no     INTEGER NOT NULL,
    opt_name   VARCHAR2(100 BYTE),
    opt_price  INTEGER
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON COLUMN kathy.option_table.opt_name IS
    '(성인-a, 청소년-t,유아-k)';

COMMENT ON COLUMN kathy.option_table.opt_price IS
    '옵션별 가격';

CREATE UNIQUE INDEX kathy.option_table_pk ON
    kathy.option_table (
        opt_no
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.option_table
    ADD CONSTRAINT option_table_pk PRIMARY KEY ( opt_no )
        USING INDEX kathy.option_table_pk;

----------------------------


CREATE TABLE kathy.payment (
    payment_id         INTEGER NOT NULL,
    payment_addpoint   INTEGER NOT NULL,
    payment_usedpoint  INTEGER,
    final_price        NUMBER,
    payment_status     INTEGER NOT NULL,
    user_id            VARCHAR2(20) NOT NULL,
    schedule_no        INTEGER NOT NULL,
    my_coupon_id       INTEGER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON COLUMN kathy.payment.payment_id IS
    '결제번호';

COMMENT ON COLUMN kathy.payment.payment_addpoint IS
    '결제건별 적립인트';

COMMENT ON COLUMN kathy.payment.payment_usedpoint IS
    '차감할 포인트';

COMMENT ON COLUMN kathy.payment.final_price IS
    '최종결제금액';

CREATE UNIQUE INDEX kathy.payment_pk ON
    kathy.payment (
        payment_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.payment
    ADD CONSTRAINT payment_pk PRIMARY KEY ( payment_id )
        USING INDEX kathy.payment_pk;

----------------------------



CREATE TABLE kathy.payment_pax_cnt (
    payment_pax_cnt_no  INTEGER NOT NULL,
    payment_id          INTEGER NOT NULL,
    option_id           INTEGER NOT NULL,
    option_cnt          INTEGER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX kathy.payment_pax_cnt_pk ON
    kathy.payment_pax_cnt (
        payment_pax_cnt_no
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.payment_pax_cnt
    ADD CONSTRAINT payment_pax_cnt_pk PRIMARY KEY ( payment_pax_cnt_no )
        USING INDEX kathy.payment_pax_cnt_pk;

----------------------------



CREATE TABLE kathy.qna (
    qna_id        INTEGER NOT NULL,
    qna_reply_id  INTEGER,
    qna_title     VARCHAR2(20 BYTE) NOT NULL,
    qna_desc      VARCHAR2(100 BYTE) NOT NULL,
    qna_date      DATE NOT NULL,
    qna_hit       INTEGER DEFAULT 0 NOT NULL,
    user_id       VARCHAR2(20) NOT NULL,
    movie_no      INTEGER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON COLUMN kathy.qna.qna_id IS
    'QNA 고유값';

COMMENT ON COLUMN kathy.qna.qna_reply_id IS
    'QNA 댓글';

COMMENT ON COLUMN kathy.qna.qna_title IS
    'QNA 제목';

COMMENT ON COLUMN kathy.qna.qna_desc IS
    'QNA 내용';

COMMENT ON COLUMN kathy.qna.qna_date IS
    '작성일자 ';

COMMENT ON COLUMN kathy.qna.qna_hit IS
    '영화 QNA글 조회수  ';

CREATE UNIQUE INDEX kathy.qna_pk ON
    kathy.qna (
        qna_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.qna
    ADD CONSTRAINT qna_pk PRIMARY KEY ( qna_id )
        USING INDEX kathy.qna_pk;

----------------------------



CREATE TABLE kathy.qna_reply (
    qna_reply_id     INTEGER NOT NULL,
    qna_reply_title  VARCHAR2(20 BYTE) NOT NULL,
    qna_reply_desc   VARCHAR2(100 BYTE) NOT NULL,
    qna_reply_date   DATE DEFAULT sysdate NOT NULL,
    qna_id           INTEGER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX kathy.qna_reply_pk ON
    kathy.qna_reply (
        qna_reply_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.qna_reply
    ADD CONSTRAINT qna_reply_pk PRIMARY KEY ( qna_reply_id )
        USING INDEX kathy.qna_reply_pk;

----------------------------



CREATE TABLE kathy.theater (
    theater_id    INTEGER NOT NULL,
    theater_name  VARCHAR2(100 BYTE) NOT NULL,
    total_seats   NUMBER DEFAULT 40 NOT NULL,
    loc_no        INTEGER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON COLUMN kathy.theater.theater_id IS
    '영화관 iD';

COMMENT ON COLUMN kathy.theater.theater_name IS
    '영화관 이름';

COMMENT ON COLUMN kathy.theater.total_seats IS
    '총 좌석';

CREATE UNIQUE INDEX kathy.theater_pk ON
    kathy.theater (
        theater_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.theater
    ADD CONSTRAINT theater_pk PRIMARY KEY ( theater_id )
        USING INDEX kathy.theater_pk;

----------------------------


CREATE TABLE kathy.user_table (
    user_id         VARCHAR2(20 BYTE) NOT NULL,
    user_name       VARCHAR2(20 BYTE) NOT NULL,
    user_pwd        VARCHAR2(30 BYTE) NOT NULL,
    user_birthdate  VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    user_phone      VARCHAR2(20) NOT NULL,
    user_email      VARCHAR2(50 BYTE),
    user_filename   VARCHAR2(100 BYTE),
    user_point      NUMBER DEFAULT 0,
    user_pic_path   VARCHAR2(100 BYTE),
    author_id       VARCHAR2(20)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON COLUMN kathy.user_table.user_id IS
    '회원 ID';

COMMENT ON COLUMN kathy.user_table.user_name IS
    '회원 이름';

COMMENT ON COLUMN kathy.user_table.user_pwd IS
    '회원 비밀번호';

COMMENT ON COLUMN kathy.user_table.user_birthdate IS
    '회원 생년월일';

COMMENT ON COLUMN kathy.user_table.user_phone IS
    '회원 연락처';

COMMENT ON COLUMN kathy.user_table.user_email IS
    '회원 이메일';

COMMENT ON COLUMN kathy.user_table.user_filename IS
    '프로필 사진 파일명';

COMMENT ON COLUMN kathy.user_table.user_point IS
    '회원 현재 포인트';

COMMENT ON COLUMN kathy.user_table.user_pic_path IS
    '프로필 사진 경로';

CREATE UNIQUE INDEX kathy.user_table_pk ON
    kathy.user_table (
        user_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE kathy.user_table
    ADD CONSTRAINT user_table_pk PRIMARY KEY ( user_id )
        USING INDEX kathy.user_table_pk;

ALTER TABLE kathy.hashtag_table
    ADD CONSTRAINT hashtag_table_add_movie_fk FOREIGN KEY ( movie_no )
        REFERENCES kathy.add_movie ( movie_no )
    NOT DEFERRABLE;

ALTER TABLE kathy.movie_casting
    ADD CONSTRAINT movie_casting_actor_fk FOREIGN KEY ( actor_id )
        REFERENCES kathy.actor ( actor_id )
    NOT DEFERRABLE;

ALTER TABLE kathy.movie_casting
    ADD CONSTRAINT movie_casting_add_movie_fk FOREIGN KEY ( movie_no )
        REFERENCES kathy.add_movie ( movie_no )
    NOT DEFERRABLE;

ALTER TABLE kathy.movie_like
    ADD CONSTRAINT movie_like_add_movie_fk FOREIGN KEY ( movie_id )
        REFERENCES kathy.add_movie ( movie_no )
    NOT DEFERRABLE;

ALTER TABLE kathy.movie_like
    ADD CONSTRAINT movie_like_user_table_fk FOREIGN KEY ( user_id )
        REFERENCES kathy.user_table ( user_id )
    NOT DEFERRABLE;

ALTER TABLE kathy.movie_res_pax
    ADD CONSTRAINT movie_res_pax_movie_shedule_fk FOREIGN KEY ( schedule_no )
        REFERENCES kathy.movie_shedule ( shedule_no )
    NOT DEFERRABLE;

ALTER TABLE kathy.movie_review
    ADD CONSTRAINT movie_review_add_movie_fk FOREIGN KEY ( movie_no )
        REFERENCES kathy.add_movie ( movie_no )
    NOT DEFERRABLE;

ALTER TABLE kathy.movie_review
    ADD CONSTRAINT movie_review_event_fk FOREIGN KEY ( event_no )
        REFERENCES kathy.event ( event_no )
    NOT DEFERRABLE;

ALTER TABLE kathy.movie_review
    ADD CONSTRAINT movie_review_user_table_fk FOREIGN KEY ( user_id )
        REFERENCES kathy.user_table ( user_id )
    NOT DEFERRABLE;

ALTER TABLE kathy.movie_shedule
    ADD CONSTRAINT movie_shedule_add_movie_fk FOREIGN KEY ( movie_no )
        REFERENCES kathy.add_movie ( movie_no )
    NOT DEFERRABLE;

ALTER TABLE kathy.movie_shedule
    ADD CONSTRAINT movie_shedule_theater_fk FOREIGN KEY ( theater_id )
        REFERENCES kathy.theater ( theater_id )
    NOT DEFERRABLE;

ALTER TABLE kathy.my_coupon
    ADD CONSTRAINT my_coupon_coupon_info_fk FOREIGN KEY ( coupon_id )
        REFERENCES kathy.coupon_info ( coupon_id )
    NOT DEFERRABLE;

ALTER TABLE kathy.my_coupon
    ADD CONSTRAINT my_coupon_user_table_fk FOREIGN KEY ( user_id )
        REFERENCES kathy.user_table ( user_id )
    NOT DEFERRABLE;

ALTER TABLE kathy.payment
    ADD CONSTRAINT payment_movie_shedule_fk FOREIGN KEY ( schedule_no )
        REFERENCES kathy.movie_shedule ( shedule_no )
    NOT DEFERRABLE;

ALTER TABLE kathy.payment
    ADD CONSTRAINT payment_my_coupon_fk FOREIGN KEY ( my_coupon_id )
        REFERENCES kathy.my_coupon ( my_coupon_id )
    NOT DEFERRABLE;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE kathy.payment_pax_cnt
    ADD CONSTRAINT payment_pax_cnt_option_table_fk FOREIGN KEY ( option_id )
        REFERENCES kathy.option_table ( opt_no )
    NOT DEFERRABLE;

ALTER TABLE kathy.payment_pax_cnt
    ADD CONSTRAINT payment_pax_cnt_payment_fk FOREIGN KEY ( payment_id )
        REFERENCES kathy.payment ( payment_id )
    NOT DEFERRABLE;

ALTER TABLE kathy.payment
    ADD CONSTRAINT payment_user_table_fk FOREIGN KEY ( user_id )
        REFERENCES kathy.user_table ( user_id )
    NOT DEFERRABLE;

ALTER TABLE kathy.qna
    ADD CONSTRAINT qna_add_movie_fk FOREIGN KEY ( movie_no )
        REFERENCES kathy.add_movie ( movie_no )
    NOT DEFERRABLE;

ALTER TABLE kathy.qna_reply
    ADD CONSTRAINT qna_reply_qna_fk FOREIGN KEY ( qna_id )
        REFERENCES kathy.qna ( qna_id )
    NOT DEFERRABLE;

ALTER TABLE kathy.qna
    ADD CONSTRAINT qna_user_table_fk FOREIGN KEY ( user_id )
        REFERENCES kathy.user_table ( user_id )
    NOT DEFERRABLE;

ALTER TABLE kathy.theater
    ADD CONSTRAINT theater_location_fk FOREIGN KEY ( loc_no )
        REFERENCES kathy.location ( loc_no )
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                            19
-- CREATE INDEX                            18
-- ALTER TABLE                             41
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   7
-- WARNINGS                                 0
