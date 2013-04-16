/*$(document).ready(function () {

    //Inicijalizacija dijaloga

    var obj = {
        id: "0"
    };
    $(".editiranjeClanakaDialog").dialog({
        modal: true,
        position: 'center',
        minHeight: 600,
        minWidth: 1024,
        autoOpen: false,
        open: function (event, ui) {
            //sakrivanje close
            $(this).parent().children().children('.ui-dialog-titlebar-close').hide();
        }

    });

    $(".btnEditiranjeOdustani").click(function () { $(".editiranjeClanakaDialog").dialog('close'); });

});

    //Otvaranje dijaloga i punjenje postojecim podacima preko web metode
    $(".btnEditClanak").click(function () {


        $(".editiranjeClanakaDialog").dialog('open');
        var row = $(this).parents("tr:first");
        var key = row.children("td:eq(1)").text();
        obj.id = key;
        $.ajax({
            type: "POST",
            url: "AdminWebService.asmx/ClanakEditText",
            data: "{'clanakid' : " + key + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                CKEDITOR.instances.editText.setData(data.d);

            }
        });
        return false;
    });


    $(".btnEditiranjeOk").click(function () {

        var ht = CKEDITOR.instances.editText.getData();
        var i = obj.id;
        $.ajax({
            type: "POST",
            url: "AdminWebService.asmx/ClanakUpdate",
            data: JSON.stringify({ sadrzaj: ht, id: i }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                alert(data.d);

            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError);
            }
        });
        $(".editiranjeClanakaDialog").dialog('close');
    });

    $(".btnEditiranjeOdustani").click(function () { $(".editiranjeClanakaDialog").dialog('close'); });

});*/

