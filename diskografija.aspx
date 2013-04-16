<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="diskografija.aspx.cs" Inherits="diskografija" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server"> 
    <link href="Styles/Site.css" rel="stylesheet" type="text/css"></link>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="sadrzaj" runat="server">
    </div>
    <p class="gumbi">
        <a id="btnBack" runat="server" onclick="javascript:history.back(); return false;"
            class="btn">Natrag</a></p>
</asp:Content>
<asp:Content ID="Help" ContentPlaceHolderID="Help" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <cc1:Accordion ID="Acc1" runat="server" SelectedIndex ="-1" AutoSize="none" FadeTransitions="true"
        TransitionDuration="200" FramesPerSecond="40" ContentCssClass="accordionContent" 
        HeaderSelectedCssClass="saccordionHeader"
        HeaderCssClass="accordionHeader" RequireOpenedPane ="false" >
        <Panes>
            <cc1:AccordionPane ID="AP" runat="server">
                <Header>
                    <a href="#" class="href">Albumi</a>
                </Header>
                <Content>
                    <li><a href="diskografija.aspx?id=2&index=0" class="href">High Voltage</a></li> 
			        <li><a href="diskografija.aspx?id=3&index=0" class="href">T.N.T</a></li> 
			        <li><a href="diskografija.aspx?id=4&index=0" class="href">Dirty Deeds Done Dirt Cheap</a></li>
                    <li><a href="diskografija.aspx?id=8&index=0" class="href">Let There Be Rock</a></li> 
			        <li><a href="diskografija.aspx?id=9&index=0" class="href">Powerage</a></li> 
			        <li><a href="diskografija.aspx?id=10&index=0" class="href">Highway To Hell</a></li>
                    <li><a href="diskografija.aspx?id=11&index=0" class="href">Back In Black</a></li> 
			        <li><a href="diskografija.aspx?id=12&index=0" class="href">For Those About to Rock</a></li> 
			        <li><a href="diskografija.aspx?id=13&index=0" class="href">Flick Of The Switch</a></li>
                    <li><a href="diskografija.aspx?id=14&index=0" class="href">Fly On The Wall</a></li> 
			        <li><a href="diskografija.aspx?id=15&index=0" class="href">Blow Up Your Video</a></li>
                    <li><a href="diskografija.aspx?id=16&index=0" class="href">The Razors Edge</a></li> 
			        <li><a href="diskografija.aspx?id=17&index=0" class="href">Ballbreaker</a></li> 
			        <li><a href="diskografija.aspx?id=18&index=0" class="href">Stiff Upper Lip</a></li>
                    <li><a href="diskografija.aspx?id=19&index=0" class="href">Black Ice</a></li>
                </Content>
            </cc1:AccordionPane>
            <cc1:AccordionPane ID="APKoncerti" runat="server">
                <Header>
                    <a href="#" class="href">Koncerti</a>
                </Header>
                <Content>
                    <li><a href="diskografija.aspx?id=5&index=1" class="href">Live At Donington</a></li>
                    <li><a href="diskografija.aspx?id=6&index=1" class="href">Live At River Plate</a></li> 
                </Content>
            </cc1:AccordionPane>
            <cc1:AccordionPane ID="APTekstovi" runat="server">
                <Header>
                    <a href="#" class="href">Tekstovi</a>
                </Header>
                <Content>
                    <li><a href="diskografija.aspx?id=7&index=2" class="href">Hard As A Rock</a></li>
                </Content>
            </cc1:AccordionPane>
        </Panes>
    </cc1:Accordion>
</asp:Content>
