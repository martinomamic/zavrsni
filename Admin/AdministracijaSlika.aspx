<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administracija.master" AutoEventWireup="true"
    CodeFile="AdministracijaSlika.aspx.cs" Inherits="Admin_AdministracijaSlika" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/ckeditor/ckeditor.js" type="text/javascript"></script>
    <link href="../Styles/admin.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!---------------------Administracija galerija-------------------------------------------->
    <h2>
        Administracija galerija</h2>
    <br />
    <div id="galerije">
        <div id="porukaGalerije" runat="server">
        </div>
        <asp:SqlDataSource ID="sdsGalerija" runat="server" ConnectionString="<%$ ConnectionStrings:acdcfanpage %>"
            DeleteCommand="DELETE FROM [Galerije] WHERE [GalerijaID] = @GalerijaID" InsertCommand="INSERT INTO [Galerije] ([NazivGalerije]) VALUES (@NazivGalerije)"
            SelectCommand="SELECT * FROM [Galerije]" UpdateCommand="UPDATE [Galerije] SET [NazivGalerije] = @NazivGalerije WHERE [GalerijaID] = @GalerijaID">
            <DeleteParameters>
                <asp:Parameter Name="GalerijaID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NazivGalerije" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NazivGalerije" Type="String" />
                <asp:Parameter Name="GalerijaID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Button ID="btnPopisGalerija" runat="server" Text="Popis galerija" OnClick="btnPopisGalerija_Click"
            CssClass="abtn" />
        <asp:Button ID="btnPopisSlika" runat="server" Text="Popis slika" OnClick="btnPopisSlika_Click"
            CssClass="abtn" />
        <br />
        <br />
        <asp:GridView ID="grdGalerija" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            DataKeyNames="GalerijaID" DataSourceID="sdsGalerija" BackColor="Black" ForeColor="White"
            CellPadding="10" Visible="False" CssClass="center" OnPageIndexChanged="grdGalerija_PageIndexChanged" OnRowCommand="grdGalerija_RowCommand" >
            <AlternatingRowStyle BackColor="gray" ForeColor="White"/>
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" EditText="Uredi"
                    DeleteText="Obrisi" ShowCancelButton="true" SelectText="Potvrdi" CancelText="Odustani"
                    UpdateText="Potvrdi" />
                <asp:BoundField DataField="GalerijaID" HeaderText="GalerijaID" ReadOnly="True" SortExpression="GalerijaID" />
                <asp:BoundField DataField="NazivGalerije" HeaderText="NazivGalerije" SortExpression="NazivGalerije" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="cbBrisi" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="Black" BorderStyle="Solid" BorderWidth="2px"/>
            <SelectedRowStyle BackColor="#006600" ForeColor="Black" />
        </asp:GridView>
        <asp:Button ID="btnMakniPopis" runat="server" Text="Makni popis" OnClick="btnMakniPopis_Click"
            CssClass="abtn" />
        <asp:SqlDataSource ID="sdsgalerijaThumbnails" runat="server" ConnectionString="<%$ ConnectionStrings:acdcfanpage %>"
            DeleteCommand="DELETE FROM [Thumbnail] WHERE [ThumbnailID] = @ThumbnailID" InsertCommand="INSERT INTO [Thumbnail] ([NazivThumbnaila], [Link], [LinkNaVelikuSliku], [Sirina], [DodatniHtml], [Visina], [GalerijaID]) VALUES (@NazivThumbnaila, @Link, @LinkNaVelikuSliku, @Sirina, @DodatniHtml, @Visina, @GalerijaID)"
            SelectCommand="SELECT * FROM [Thumbnail]" UpdateCommand="UPDATE [Thumbnail] SET [NazivThumbnaila] = @NazivThumbnaila, [Link] = @Link, [LinkNaVelikuSliku] = @LinkNaVelikuSliku, [Sirina] = @Sirina, [DodatniHtml] = @DodatniHtml, [Visina] = @Visina, [GalerijaID] = @GalerijaID WHERE [ThumbnailID] = @ThumbnailID">
            <DeleteParameters>
                <asp:Parameter Name="ThumbnailID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NazivThumbnaila" Type="String" />
                <asp:Parameter Name="Link" Type="String" />
                <asp:Parameter Name="LinkNaVelikuSliku" Type="String" />
                <asp:Parameter Name="Sirina" Type="Int32" />
                <asp:Parameter Name="DodatniHtml" Type="String" />
                <asp:Parameter Name="Visina" Type="Int32" />
                <asp:Parameter Name="GalerijaID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NazivThumbnaila" Type="String" />
                <asp:Parameter Name="Link" Type="String" />
                <asp:Parameter Name="LinkNaVelikuSliku" Type="String" />
                <asp:Parameter Name="Sirina" Type="Int32" />
                <asp:Parameter Name="DodatniHtml" Type="String" />
                <asp:Parameter Name="Visina" Type="Int32" />
                <asp:Parameter Name="GalerijaID" Type="Int32" />
                <asp:Parameter Name="ThumbnailID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="grdDetaljiGalerija" runat="server" AllowPaging="True" AllowSorting="True"
            DataSourceID="sdsgalerijaThumbnails" BackColor="Black" ForeColor="White" CellPadding="10"
            AutoGenerateColumns="False" DataKeyNames="ThumbnailID" Visible="False" OnPageIndexChanged="grdDetaljiGalerija_PageIndexChanged"
              >
            <AlternatingRowStyle BackColor="gray" ForeColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" EditText="Uredi"
                    DeleteText="Obrisi" ShowCancelButton="true" SelectText="Potvrdi" CancelText="Odustani"
                    UpdateText="Potvrdi"/>
                <asp:BoundField DataField="ThumbnailID" HeaderText="ThumbnailID" ReadOnly="True"
                    SortExpression="ThumbnailID" />
                <asp:BoundField DataField="NazivThumbnaila" HeaderText="Naziv thumbnaila" SortExpression="NazivThumbnaila" />
                <asp:BoundField DataField="Link" HeaderText="Link na thumbnail" SortExpression="Link" />
                <asp:BoundField DataField="LinkNaVelikuSliku" HeaderText="Link na sliku" SortExpression="LinkNaVelikuSliku" />
                <asp:BoundField DataField="Sirina" HeaderText="Sirina" SortExpression="Sirina" />
                <asp:BoundField DataField="Visina" HeaderText="Visina" SortExpression="Visina" />
                <asp:BoundField DataField="DodatniHtml" HeaderText="Opis slike" SortExpression="DodatniHtml" />
                <asp:BoundField DataField="GalerijaID" HeaderText="GalerijaID" SortExpression="GalerijaID" />
            </Columns>
            <HeaderStyle BackColor="Black" BorderStyle="Solid" BorderWidth="2px" CssClass="grid"/>
            <SelectedRowStyle BackColor="#006600" ForeColor="Black" />
        </asp:GridView>
        <br />
        <div id="dodavanjeGalerije">
            <asp:Label ID="lblDodajGaleriju" runat="server" Text="Dodaj galeriju : "></asp:Label>
            <asp:TextBox ID="txtDodajGaleriju" runat="server"></asp:TextBox>
            <asp:Button ID="btnDodajGaleriju" runat="server" Text="Dodaj u bazu" OnClick="btnDodajGaleriju_Click"
                CssClass="abtn" ValidationGroup="galerija" />
            <asp:RequiredFieldValidator ID="validacijaGalerija" runat="server" ControlToValidate="txtDodajGaleriju"
                ErrorMessage="Potrebno je unijeti ime galerije" ForeColor="Red" ValidationGroup="galerija"></asp:RequiredFieldValidator>
            <br />
        </div>
    </div>
    <!---------------------Administracija slika-------------------------------------------->
    <h2>
        Administracija slika</h2>
    <br />
    <div class="slike">
        <h3>
            Dodavanje thumbnailova i slika</h3>
        <div id="porukaODodavanju" runat="server">
        </div>
        <div id="dodajThumb">
            <asp:Label ID="lblDodajThumb" runat="server" Text="Dodavanje thumbnaila : "></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <asp:RequiredFieldValidator ID="validacijaThumbFileUpload" runat="server" ControlToValidate="FileUpload1"
                ErrorMessage="Potrebno je unijeti put do lokacije thumbnaila na disku" ForeColor="Red"
                ValidationGroup="thumb"></asp:RequiredFieldValidator>
        </div>
        <div id="dodajVelikuSliku">
            <asp:Label ID="lblDOdajVelikuSliku" runat="server" Text="Dodavanje slike : "></asp:Label>
            <asp:FileUpload ID="FileUpload2" runat="server" />
            <br />
            <br />
        </div>
        <div id="nazivGalerije">
            <asp:SqlDataSource ID="sdsDodajThumbGalerije" runat="server" ConnectionString="<%$ ConnectionStrings:acdcfanpage %>"
                SelectCommand="SELECT * FROM [Galerije]"></asp:SqlDataSource>
            <div>
                <asp:Label ID="lblOdaberiNazivGalerije" runat="server" Text="Odaberite naziv galerije: "></asp:Label>
                <asp:DropDownList ID="ddlNazivGalerije" runat="server" DataSourceID="sdsDodajThumbGalerije"
                    DataTextField="NazivGalerije" DataValueField="GalerijaID">
                </asp:DropDownList>
                <br />
                <br />
            </div>
        </div>
        <div id="dimenzije">
            <asp:Label ID="lblSirina" runat="server" Text="Upišite širinu thumbnaila: "></asp:Label>
            <asp:TextBox ID="txtSirinaThumbnaila" runat="server" Width="126px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="validacijaSirinaThumbnaila" runat="server" ControlToValidate="txtSirinaThumbnaila"
                ErrorMessage="Unesite širinu thumbnaila u pikselima" ForeColor="Red" ValidationGroup="thumb"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblVisina" runat="server" Text="Upišite visinu thumbnaila: "></asp:Label>
            <asp:TextBox ID="txtVisinaThumbnaila" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="validacijaVisineThumbnaila" runat="server" ControlToValidate="txtVisinaThumbnaila"
                ErrorMessage="Unesite visinu thumbnaila u pikselima" ForeColor="Red" ValidationGroup="thumb"></asp:RequiredFieldValidator><br />
        </div>
        <div id="dodatniHtml">
            <span>
                <asp:Label ID="lblDodatniHtml" runat="server" Text="Upišite dodatne informacije uz thumbnail : "></asp:Label></span>
            <CKEditor:CKEditorControl ID="ftbOpisThumbnaila" runat="server" ClientIDMode="Static"></CKEditor:CKEditorControl>
        </div>
        <span>
            <asp:Button ID="btnDodaj" runat="server" Text="Dodaj u bazu" OnClick="btnDodaj_Click"
                CssClass="abtn" ValidationGroup="thumb" />
            <asp:Button ID="btnOdustani" runat="server" Text="Odustani" OnClick="btnOdustani_Click"
                CssClass="abtn" CausesValidation="false" />
        </span>
    </div>
</asp:Content>
