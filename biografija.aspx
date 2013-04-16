<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="biografija.aspx.cs" Inherits="biografija" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="Styles/Help.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Help" runat="Server">
    <div>
        <ul class="help">
            <li><a href="biografija.aspx?id=1">Band</a></li>
            <li><a href="biografija.aspx?id=2">Angus Young</a></li>
            <li><a href="biografija.aspx?id=3">Bon Scott</a></li>
            <li><a href="biografija.aspx?id=4">Brian Johnson</a></li>
            <li><a href="biografija.aspx?id=5">Cliff Williams</a></li>
            <li><a href="biografija.aspx?id=6">Malcolm Young</a></li>
            <li><a href="biografija.aspx?id=7">Phil Rudd</a></li>
            <li><a href="biografija.aspx?id=8">Ostali vazni clanovi</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="sadrzaj" runat="server">
    </div>
    <p class="gumbi">
        <a id="btnBack" runat="server" onclick="javascript:history.back(); return false;"
            class="btn">Natrag</a><a id="btnGalerija" runat="server" class="btn">Galerija slika</a>
    </p>
</asp:Content>
