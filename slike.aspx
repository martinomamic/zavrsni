<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="slike.aspx.cs" Inherits="slike" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<link href="Styles/galerija.css" rel="stylesheet" type="text/css" />
<script src="Scripts/slider.js" type="text/javascript">
    $(document).ready(function () {
        var index = 0;
        var images = $("#gallery img");
        var thumbs = $("#thumbs img");
        for (i = 0; i < images.length; ++i) {
            $(images[i]).addClass("image" + i);
            $(thumbs[i]).addClass("thumb" + i);
        }
        images.fadeOut(1);
        show(index);
        $("#next").click(function () {
            if (index < (images.length - 1)) index += 1;
            else index = 0;
            show(index);
        });
        $("#prev").click(function () {
            if (index > 0) index -= 1;
            else index = (images.length - 1);
            show(index);
        });
        $("#thumbs img").click(function () {
            index = $(this).index();
            show(index);
        });
        /* $("#thumbs img").hover(function () {
        $("#thumbs img").not(this).stop().animate({ opacity: 0.7 });
        }, function () {
        $("#thumbs img").stop().animate({ opacity: 1.0 });
        });*/
        function show(index) {
            images.fadeOut(0.0001);
            $(".image" + index).fadeIn(0.0001);
        }
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Help" runat="server">
<div id="thumbs">
<img class="thumb0" alt="Angus Young" src="Pics/Thumbnails/Angus_schoolboythumb.png" />
<img class="thumb1" alt="Malcolm Young" src="Pics/Thumbnails/Malcolm_Youngthumb.jpg" />
<img class="thumb2" alt="Bon Scott" src="Pics/Thumbnails/bonscott_fthumb.jpg" />
<img class="thumb3" alt="Brian Johnson" src="Pics/Thumbnails/Brian-Johnsonthumb.jpg" />
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<div id="container" style="text-align:center">
<p><strong></strong></p>
<br/>
<img id="prev" src="Pics/Slider/left%20bolt.png" />
<div id="gallery" style="margin:auto; text-align:center;display:inline;">
<img class="image0" alt="Angus" src="Pics/Galerije/Angus_schoolboy.png" style="display: inline;" title="Angus Young" />
<img class="image1" alt="Malcolm" src="Pics/Galerije/Malcolm_Young.jpg" style="display: none;" title="Malcolm Young" />
<img class="image2" alt="Bon" src="Pics/Galerije/bonscott_f.jpg" style="display: none;" title="Bon Scott" />
<img class="image3" alt="Brian" src="Pics/Galerije/Brian-Johnson.jpg" style="display: none;" title="Brian Johnson" />
<a href="http://apycom.com/"></a>
</div>
<img id="next" src="Pics/Slider/right%20bolt.png" />
<div id="description"></div>
</asp:Content>
