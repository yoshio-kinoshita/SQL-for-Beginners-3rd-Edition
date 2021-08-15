' mysql -u root sakila '

'create table '
create table person
(person_id SMALLINT UNSIGNED,
fname varchar(20),
lname varchar(20),
eye_color char(2),
birth_date date,
street varchar(20),
city varchar(20),
state varchar(20),
country varchar(20),
postal_code varchar(20),
constraint pk_pwerson primary key (person_id)
);

' 外部キーチェックを解除 '
set foreign_key_checks=0;
' インクリメントを設定 '
alter table person modify person_id SMALLINT UNSIGNED auto_increment;
' 外部キーチェックをON '
set foreign_key_checks=1;

' personデータ投入'
insert into person
(person_id, fname, lname, eye_color, birth_date)
values(null, 'william', 'turner','BR', '1972-05-27');

' select '
select person_id, fname, lname, birth_date from person;

' select + where'
select person_id, fname, lname, birth_date from person
where lname = 'turner';

' rename table '
rename table favarite_food to favorite_food;

' favorite_food 登録'
insert into favorite_food(person_id, food)
values(1, 'pizza');
' favorite_food 登録'
insert into favorite_food(person_id, food)
values(1, 'cookies');
' favorite_food 登録'
insert into favorite_food(person_id, food)
values(1, 'nachos');

' select food'
select food from favorite_food where person_id = 1 order by food;

' enum設定 '

' personデータ投入'
insert into person(person_id, fname, lname, eye_color, birth_date, 
street, city, state, country, postal_code)
values(null, 'susan', 'smith', 'BL', '1975-11-02',
'23 maple st.', 'arlington', 'VA', 'USA', '20220');

' person select'
select person_id, fname, lname, birth_date from person;

'update person'
update person
set street = '1225 tremont st.',
city = 'boston',
state = 'ma',
country = 'USA',
postal_code = '02138'
where person_id = 1;

'delete person'
delete from person where person_id = 2;

'depulicate entry'
insert into person
(person_id, fname, lname, eye_color, birth_date)
values(1, 'charles', 'fulton', 'GR', '1968-01-15');

' not exsits foreign key'
insert into favorite_food(person_id, food)
values(999, 'lasagna')

update person
set eye_color = 'ZZ'
where person_id = 1;

select first_name, last_name from customer where last_name = 'ZIEGLER';

select * from category;

' select句 '
select * from language;

select version(), user(), database();

select language_id, 'COMMON' language_usage,
language_id * 3.1415927 lang_pi_value,
upper(name) language_name 
from language;

select language_id, 'COMMON' as language_usage,
language_id * 3.1415927 as lang_pi_value,
upper(name) as language_name 
from language;

select actor_id from film_actor order by actor_id;
select distinct actor_id from film_actor order by actor_id;

'from句

1つ以上のテーブルのリスト
'

'
テーブルの種類

永続テーブル: create table
派生テーブル: サブクエリによって返され、メモリ内で保持する行セット
一時テーブル: メモリ内の揮発性データ(SQL Serverにある、@マーク付きテーブル.セッション内でのみ利用可能)
仮想テーブル: view

'