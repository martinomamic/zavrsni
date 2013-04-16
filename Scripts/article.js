$(document).ready(function () {
    var im = new Image(100, 100);
    im.src = "Pics/Galerije/preload.gif";
    im.onload = function () {
        $("#background").css({
            "background-image": "url('" + im.src + "')"
        });
    }
    $("#background").css({ "display": "block", "margin": "auto", "text-align": "center", "background-repeat": "no-repeat", "background-position": "center", "height": "500px", "width": "500px" });

    (function ($, undefined) { if ($.ui && $.ui.dialog) { $.ui.dialog.overlay.events = $.map('focus,keydown,keypress'.split(','), function (event) { return event + '.dialog-overlay'; }).join(' '); } } (jQuery));

    $("#desni_prozor img").css({ "cursor": "pointer" });
    $("#desni_prozor img").click(function (e) {
        var path = this.src;

        $("#opis").css({ "display": "none" });

        $.ajax({
            type: "POST",
            url: "KorisnikWebService.asmx/LinkNaVelikuSliku",
            data: JSON.stringify({ linkNaThumbnail: path }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != null) {
                    $("#velikaSlika").css({ "background-color": "black", "padding": "20px" });

                    $("#velikaSlika").dialog({ modal: true,
                        dialogClass: 'klasa',
                        hide: { effect: "explode", duration: 500 },
                        show: { effect: "explode", duration: 500 },
                        closeText: 'Zatvori',
                        position: 'center',
                        minWidth: '600',
                        minHeight: '600',
                        open: function () {
                            $('div.klasa span.ui-icon').css({ 'display': 'block', 'color': 'white', 'text-decoration': 'none' });
                            $('div.klasa span.ui-icon').css({ 'float': 'left', 'color': 'white', 'text-decoration': 'none', 'font-weight': 'bold' });
                            $('.klasa').css({ "-moz-box-shadow": "0 0 5px 5px rgba(0,0,0,0.6)", "-webkit-box-shadow": "0 0 5px 5px rgba(0,0,0,0.6)", "box-shadow": "0 0 5px 5px rgba(0,0,0,0.6)", "color": "white", "border": "thin outset #0000ff" });
                            $('#opis').css({ "margin-top": "10px", "display": "block" });
                            $(".ui-widget-overlay").css({ "background-color": "black", "position": "absolute", "top": "0px", "left": "0px", "opacity": "0.5", "filter": "alpha(opacity=50)" });
                            $(".ui-dialog-titlebar").css({ "background-image": "url(Pics/Galerija/)", "background-color": "#000044", "padding": "10px", "bacground-repeat": "repeat-x" });
                        },
                        close: function () {

                            $("#background").css({
                                "background-image": "url('" + im.src + "')"
                            });
                        }

                    });
                    $("#background").css({ "background-image": "url('" + data.d + "')" });

                }
            }
        });

        $("#opis").html("");
        $.ajax({
            type: "POST",
            url: "KorisnikWebService.asmx/OpisUzSliku",
            data: JSON.stringify({ linkNaThumbnail: path }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $("#opis").html(data.d);
            }
        });

    });




});
