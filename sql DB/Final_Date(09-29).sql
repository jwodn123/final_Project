
-- ���� �ü�
insert into amenity values(1,'�ֹ�');
insert into amenity values(2,'��Ǫ');
insert into amenity values(3,'����');
insert into amenity values(4,'������');
insert into amenity values(5,'��Ź��');
insert into amenity values(6,'������');
insert into amenity values(7,'�������ͳ�');
insert into amenity values(8,'��ħ�Ļ�');
insert into amenity values(9,'�ǳ�������');
insert into amenity values(10,'�ʰ���');
insert into amenity values(11,'�ٸ���');
insert into amenity values(12,'��� ����̱�');
insert into amenity values(13,'TV');
insert into amenity values(14,'�Ʊ� ħ��');
insert into amenity values(15,'���ƿ� ��Ź');
insert into amenity values(16,'���� üũ��');
insert into amenity values(17,'ȭ�� �溸��');
insert into amenity values(18,'�غ��� ����');
insert into amenity values(19,'��� �ܵ� ���');

-- �ü�
insert into facility values(1,'�ǹ� �� ����');
insert into facility values(2,'������');
insert into facility values(3,'���� �ٺ�ť');
insert into facility values(4,'�ｺ��');
insert into facility values(5,'������');

-- �ǹ� ����
insert into build_type values (1,'����');
insert into build_type values (2,'�۷���');
insert into build_type values (3,'�Խ�Ʈ �Ͽ콺');
insert into build_type values (4,'���');
insert into build_type values (5,'����');
insert into build_type values (6,'ȣ��');
insert into build_type values (7,'B&B');
insert into build_type values (8,'����Ʈ');

--�̿� ��Ģ
insert into rule values (1,'��������');
insert into rule values (2,'�ݷ����� �Խ� ����');

--1:1���� ����
insert into question_type values(1, '�̿�');
insert into question_type values(2, '����');
insert into question_type values(3, '����');
insert into question_type values(4, '����');
insert into question_type values(5, 'ȸ��');

--���ֹ������� ����
insert into faq_type values(1, 'top7');
insert into faq_type values(2, '�̿�');
insert into faq_type values(3, '����');
insert into faq_type values(4, '����');
insert into faq_type values(5, '����');
insert into faq_type values(6, 'ȸ��');

--����
insert into coupon values(1, 1000, '2020-09-01', '2020-09-30');
insert into coupon values(2, 3000, '2020-09-10', '2020-09-30');
insert into coupon values(3, 5000, '2020-09-3', '2020-09-30');
insert into coupon values(4, 10000, '2020-09-10', '2020-09-30');
commit;