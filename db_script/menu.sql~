create table restoMenu(
    dishname text,
    price numeric,
    dish_id serial primary key,

);

--getter

create or replace function get_dish_byId (in int, out text, out numeric)
    return setof record as
$$

    select dishname, price where dish_id = $1;
$$

language 'sql';


create or replace
    function setDish(p_dishname text, p_price numeric)
    return text as
$$
    declare
        v_dishname text; v_price numeric;
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









