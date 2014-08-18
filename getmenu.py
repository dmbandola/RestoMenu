from dosql import *
import json
imprort cgi


def index(req, dish_id)
    a = doSql()
    dish_id = cgi.escape(dish_id)
    dishes = a.execquery(select * from get_dish_byId("+dish_id+")", False)
    result = []
    for dish in dishes:
        dish = map(str, dish)
        result.append(dish)

    return json.dumps(result)
