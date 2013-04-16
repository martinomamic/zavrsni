$(document).ready(function () {
    $("#accordion1").click(function () {
        $("#accordion1_sadrzaj").slideToggle('slow');
    });
    $("#accordion2").click(function () {
        $("#accordion2_sadrzaj").slideToggle('slow');
    });
    $("#accordion3").click(function () {
        $("#accordion3_sadrzaj").slideToggle('slow');
    });
    

 
 
  });


    });
    $.fn.modalni_dialog = function (sirina, visina, poruka) {

        $("#poruka").css({ "margin-top": "50px" });

        $("#dialog_poruke").dialog({ modal: true,
            dialogClass: 'klasa',
            hide: { effect: "fadeOut", duration: 700 },
            show: { effect: "fadeIn", duration: 700 },
            closeText: 'x',
            position: 'center',
            minWidth: sirina,
            minHeight: visina,
            open: function () {
                $('div.klasa span.ui-icon').css({ 'display': 'block', 'color': 'white', 'text-decoration': 'none' });
                $(".ui-dialog-titlebar").css({ "cursor":"move"});
                $('.klasa').css({ "color": "white", "background":"black", "border": "1px solid silver" , "border-radius" : "15px"});
                $(".ui-widget-overlay").css({ "position": "absolute" });
                $('div.klasa span.ui-icon').css({ 'float': 'right', 'color': 'white', 
                'text-decoration': 'none', 'font': 'Comic Sans MS', "border":"1px solid silver", "border-radius":"2px", "padding":"5px", "margin":"5px" });
            }

        });
        $("#poruka").text(poruka);
    }
});
