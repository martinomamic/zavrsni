<%@ Page Language="C#" AutoEventWireup="true" CodeFile="galerija.aspx.cs" Inherits="galerija" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script src="Scripts/jquery-1.8.2.js" type="text/javascript"></script>
    <link href="Styles/galerija.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/Silverlight.js" type="text/javascript"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <a id="btnBack" runat="server" onclick="javascript:history.back(); return false;"
            class="btn">Natrag</a>
    <div class="galerija">

            <object type="application/x-silverlight-2" 
                data="data:application/x-silverlight-2," 
                width="600" height="400"> 
            <param name="background" value="black" /> 
            <param name="source" value="Vertigo.SlideShow.xap" /> 
            <param name="initParams" value="DataProvider=XmlDataProvider;Path=galerijaxml.aspx?id=<%=Request.QueryString["id"] %>" />  
        </object>
        <iframe id="_sl_historyFrame" style="visibility: hidden; height: 0px; width: 0px;
            border: 0px"></iframe>
    </div>
    </form>
</body>
</html>
