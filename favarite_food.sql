create table favarite_food
(person_id SMALLINT UNSIGNED,
food varchar(20),
constraint pk_favarite_food primary key (person_id, food),
constraint fk_fav_food_personal_id Foreign key(person_id)
references person (person_id)
);