
-- 편의 시설
insert into amenity values(1,'주방');
insert into amenity values(2,'샴푸');
insert into amenity values(3,'난방');
insert into amenity values(4,'에어컨');
insert into amenity values(5,'세탁기');
insert into amenity values(6,'건조기');
insert into amenity values(7,'무선인터넷');
insert into amenity values(8,'아침식사');
insert into amenity values(9,'실내벽난로');
insert into amenity values(10,'옷걸이');
insert into amenity values(11,'다리미');
insert into amenity values(12,'헤어 드라이기');
insert into amenity values(13,'TV');
insert into amenity values(14,'아기 침대');
insert into amenity values(15,'유아용 식탁');
insert into amenity values(16,'셀프 체크인');
insert into amenity values(17,'화재 경보기');
insert into amenity values(18,'해변과 인접');
insert into amenity values(19,'욕실 단독 사용');

-- 시설
insert into facility values(1,'건물 내 주차');
insert into facility values(2,'자쿠지');
insert into facility values(3,'개인 바베큐');
insert into facility values(4,'헬스장');
insert into facility values(5,'수영장');

-- 건물 유형
insert into build_type values (1,'주택');
insert into build_type values (2,'글램핑');
insert into build_type values (3,'게스트 하우스');
insert into build_type values (4,'펜션');
insert into build_type values (5,'복층');
insert into build_type values (6,'호텔');
insert into build_type values (7,'B&B');
insert into build_type values (8,'리조트');

--이용 규칙
insert into rule values (1,'흡연가능');
insert into rule values (2,'반려동물 입실 가능');

--1:1문의 유형
insert into question_type values(1, '이용');
insert into question_type values(2, '예약');
insert into question_type values(3, '결제');
insert into question_type values(4, '쿠폰');
insert into question_type values(5, '회원');

--자주묻는질문 유형
insert into faq_type values(1, 'top7');
insert into faq_type values(2, '이용');
insert into faq_type values(3, '예약');
insert into faq_type values(4, '결제');
insert into faq_type values(5, '쿠폰');
insert into faq_type values(6, '회원');

--쿠폰
insert into coupon values(1, 1000, '2020-09-01', '2020-09-30');
insert into coupon values(2, 3000, '2020-09-10', '2020-09-30');
insert into coupon values(3, 5000, '2020-09-3', '2020-09-30');
insert into coupon values(4, 10000, '2020-09-10', '2020-09-30');
commit;