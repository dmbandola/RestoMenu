create table restoMenu(
    dishname text,
    price text,
    dish_id serial primary key,

);


insert into restoMenu(dishname, price) values ('Fruit Bowl w/ Nuts and Raisins', '$10.25')
insert into restoMenu(dishname, price) values ('Bread Basket', '$7.50')
insert into restoMenu(dishname, price) values ('Fruit Bread', '$2.75')
insert into restoMenu(dishname, price) values ('English Muffin', '$1.75')
insert into restoMenu(dishname, price) values ('Muffins', '$2.50')
insert into restoMenu(dishname, price) values ('Vegan, Organic Fruit & Nut Granola', '$12.50')
insert into restoMenu(dishname, price) values ('Blueberry Pancakes', '$8.50')
insert into restoMenu(dishname, price) values ('Thick Sliced Orange and Almond French Toast', '$7.75')
insert into restoMenu(dishname, price) values ('Belgian Waffle w/ Pecans', '$7.25')



--getter

create or replace function get_dish_byId (in int, out text, out text)
    returns setof record as
$$

    select dish, price where dish_id = $1;
$$

language 'sql';


create or replace
    function setDish(p_dishname text, p_price text)
    return text as
$$
    declare
        v_dishname text; v_price text;
    begin
        select into v_dishname dishname, v_price price where dishname = p_dishname and price = p_price;

        if v_dishname isnull then
            insert into restoMenu(dishname, price) values (p_dishname, p_price);
        else
            update restoMenu set dishname = p_dishname, price = p_price where dishname = p_dishname and price = p_price;
        end if;
        return 'OK';
    end;
$$
language 'plpgsql'









