var siteloc = "http://localhost/RestoMenu"
var scriptloc = "/scripts/"

function fetchmenu(dish_id)
{
    $.ajax({
        url: siteloc + scriptloc + "getmenu.py",
        data: { dish_id:dish_id},
        dataType: 'json',
        success: function (res){ console.log(res)
            if(res[0][0] !="None")
                {
                    table = '<table border="1">';
                    for (i=0; i<res.length;i++)
                    {
                        table+="<tr>";
                        for(j=0;j<row.length;j++)
                        {
                            table +="<td>" + row[j] + "</td>";
                        }
                        table +="</tr>";
                    }
                    table += "</table>";
                    $("#target").html(table);
                } //end if
         }
    });
}
