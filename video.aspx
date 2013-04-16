<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="video.aspx.cs" Inherits="video" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Styles/Site.css" rel="stylesheet" type="text/css"></link>
      <script type="text/javascript" src="Scripts/jquery.fitvids.js"></script>

      <script type="text/javascript">
          function hideMe(id) {
              var element = document.getElementById("video");
              if (element.style.display == "block")
                  element.style.display = "none";
          }
      
      </script>
</asp:Content>
<asp:Content ID="Help" ContentPlaceHolderID="Help" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <cc1:Accordion ID="Acc1" runat="server" SelectedIndex="-1" AutoSize="none" FadeTransitions="true"
        TransitionDuration="200" FramesPerSecond="40" ContentCssClass="accordionContent"
        HeaderCssClass="accordionHeader" RequireOpenedPane="false" HeaderSelectedCssClass="saccordionHeader">
        <Panes>
            <cc1:AccordionPane ID="APAlbumi" runat="server">
                <Header>
                    <a href="#" class="href">Albumi</a>
                </Header>
                <Content>
                    <cc1:Accordion ID="AccAlbumi" runat="server" SelectedIndex="-1" AutoSize="none" FadeTransitions="true"
                        TransitionDuration="200" FramesPerSecond="40" ContentCssClass="accordionContent" HeaderCssClass="accordionHeader"
                        RequireOpenedPane="false">
                        <Panes>
                            <cc1:AccordionPane ID="APHighVoltage" runat="server">
                                <Header>
                                    <a href="#" class="href">High Voltage</a>
                                </Header>
                                <Content>
                                    <li><a href="http://www.youtube.com/embed/Tf9lhev1qwA" target="player" class="href" onclick="hideMe()" />Baby please don't go</li>
                                    <li><a href="http://www.youtube.com/embed/cBB5loH3T1g" target="player" class="href" onclick="hideMe()" />Little Lover</li>
                                    <li><a href="http://www.youtube.com/embed/jZq6jnL9Czw" target="player" class="href" onclick="hideMe()" />She's got balls</li>
                                    <li><a href="http://www.youtube.com/embed/BNg70AYB800" target="player" class="href" onclick="hideMe()" />Stick around</li>
                                    <li><a href="http://www.youtube.com/embed/6FpeX7JqdyI" target="player" class="href" onclick="hideMe()" />Soul stripper</li>
                                    <li><a href="http://www.youtube.com/embed/kaL_kOhT300" target="player" class="href" onclick="hideMe()" />You ain't got
                                        a hold on me</li>
                                    <li><a href="http://www.youtube.com/embed/8P2P92nIj5o" target="player" class="href" onclick="hideMe()" />Love song</li>
                                    <li><a href="http://www.youtube.com/embed/kI_wcE_MEJg" target="player" class="href" onclick="hideMe()" />Show business</li>
                                </Content>
                            </cc1:AccordionPane>
                            <cc1:AccordionPane ID="APTNT" runat="server">
                                <Header>
                                    <a href="#" class="href">T.N.T</a>
                                </Header>
                                <Content>
                                    <li><a href="http://www.youtube.com/embed/H1iR2Wi3u5o" target="player" class="href" onclick="hideMe()"/>It's a long
                            way to the top</li>
                                    <li><a href="http://www.youtube.com/embed/EyrdEa_-eMI" target="player" class="href" onclick="hideMe()"/>Rock'n'Roll
                            singer</li>
                                    <li><a href="http://www.youtube.com/embed/L3fP18gIoAY" target="player" class="href" onclick="hideMe()"/>The Jack</li>
                                    <li><a href="http://www.youtube.com/embed/AWijlCfZat8" target="player" class="href" onclick="hideMe()"/>Live Wire</li>
                                    <li><a href="http://www.youtube.com/embed/f7_OrM9-3R8" target="player" class="href" onclick="hideMe()"/>T.N.T</li>
                                    <li><a href="http://www.youtube.com/embed/8tvNA5MtV7c" target="player" class="href" onclick="hideMe()"/>Rocker</li>
                                    <li><a href="http://www.youtube.com/embed/qnrRsMtKFEg" target="player" class="href" onclick="hideMe()"/>Can i sit next
                            to you girl</li>
                                    <li><a href="http://www.youtube.com/embed/wsgx_cIhG1c" target="player" class="href" onclick="hideMe()"/>High Voltage</li>
                                    <li><a href="http://www.youtube.com/embed/J9zMOxVj2Ec" target="player" class="href" onclick="hideMe()"/>School days(Chuck
                            Berry)</li>
                                </Content>
                            </cc1:AccordionPane>
                            <cc1:AccordionPane ID="APDirty" runat="server">
                                <Header>
                                    <a href="#" class="href">Dirty Deeds Done Dirt Cheap</a>
                                </Header>
                                <Content>
                                    <li><a href="http://www.youtube.com/embed/zfsvS4v8ZL8" target="player" class="href" onclick="hideMe()"/>Dirty deeds
                            done dirt cheap</li>
                                    <li><a href="http://www.youtube.com/embed/cwUVCo-Y3Mo" target="player" class="href" onclick="hideMe()"/>Ain't no fun</li>
                                    <li><a href="http://www.youtube.com/embed/iio8Djf4O8o" target="player" class="href" onclick="hideMe()"/>There's gonna
                            be some rockin</li>
                                    <li><a href="http://www.youtube.com/embed/XNdagpIgItw" target="player" class="href" onclick="hideMe()"/>Ride on</li>
                                    <li><a href="http://www.youtube.com/embed/GeFqBBzqqiU" target="player" class="href" onclick="hideMe()"/>R.I.P(>Rock
                            in peace)</li>
                                    <li><a href="http://www.youtube.com/embed/eY9H0s5sph0" target="player" class="href" onclick="hideMe()"/>Problem child</li>
                                    <li><a href="http://www.youtube.com/embed/7Z4ijIQYYNo" target="player" class="href" onclick="hideMe()"/>Squealer</li>
                                    <li><a href="http://www.youtube.com/embed/_W-fIn2QZgg" target="player" class="href" onclick="hideMe()"/>Big Balls</li>
                                    <li><a href="http://www.youtube.com/embed/gYou7SqyDdo" target="player" class="href" onclick="hideMe()"/>Jailbreak</li>
                                </Content>
                            </cc1:AccordionPane>
                        </Panes>
                    </cc1:Accordion>
                </Content>
            </cc1:AccordionPane>
            <cc1:AccordionPane ID="APKoncerti" runat="server">
                <Header>
                    <a href="#" class="href">Koncerti</a>
                </Header>
                <Content>
                    <li><a href="http://www.youtube.com/embed/84f8vp2ubc8" target="player" class="href" onclick="hideMe()"/>Live At River Plate 2011</li>
                    <li><a href="http://www.youtube.com/embed/iwSZnTSio_Y" target="player" class="href" onclick="hideMe()"/>Live In Paris 1979</li>
                    <li><a href="http://www.youtube.com/embed/dDYmDLiWsfc" target="player" class="href" onclick="hideMe()"/>Live At Circus Krone 2003</li>
                    <li><a href="http://www.youtube.com/embed/rJkcZGwKJlY" target="player" class="href" onclick="hideMe()"/>Live At Munich 2001</li>
                    <a href="#" style="display:none; cursor:default; clear:both;"></a>
                </Content>
            </cc1:AccordionPane>
            <cc1:AccordionPane ID="APDokumentarci" runat="server">
            <Header>
                    <a href="#" class="href">Dokumentarci</a>
                </Header>
                <Content>
                    <li><a href="http://www.youtube.com/embed/pQB-cMmtEds" target="player" class="href" onclick="hideMe()"/>Let there be rock</li>
                    <li><a href="http://www.youtube.com/embed/KVirTsuBzOY" target="player" class="href" onclick="hideMe()"/>Early years</li>
                    <li><a href="http://www.youtube.com/embed/l88_wW9yH-Y" target="player" class="href" onclick="hideMe()"/>Back in black</li>
                    <li><a href="http://www.youtube.com/embed/5ib7X5wRJXE" target="player" class="href" onclick="hideMe()"/>Bon Scott-A Tribute</li>
                    <a href="#" style="display:none; cursor:default; clear:both;"></a>
                </Content>
            
            </cc1:AccordionPane>
        </Panes>
    </cc1:Accordion>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="container" style="display:block;">
    <p id="video" style="display:block;" ><strong>AC/DC video kolekcija</strong><br /><br />  Ovdje ćete naći veliku većinu pjesama, nekoliko koncerata i još ponešto videouradaka iz bogatog opusa AC/DC-a koji se mogu naći na Youtubeu i sličnim stranicama</p>
        <div class="vendor">
            <iframe name="player" width="520" height="330" src="" frameborder="0"></iframe>
        </div>
    </div> 
</asp:Content>
