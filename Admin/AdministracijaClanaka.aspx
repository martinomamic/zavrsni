<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administracija.master" AutoEventWireup="true"
    CodeFile="AdministracijaClanaka.aspx.cs" Inherits="Admin_AdministracijaClanaka"
    ValidateRequest="false" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Styles/admin.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="../Scripts/Admin.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.9.1.custom.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="pregledieditiranjeClanaka">
        <h2>Pregled i editiranje članaka</h2><br />
        <asp:Button ID="btnPopisClanaka" runat="server" Text="Popis članaka" OnClick="btnPopisClanaka_Click" CssClass="abtn" />
        <asp:Button ID="btnMakniPopis" runat="server" Text="Makni popis" CssClass="abtn" OnClick="btnMakniPopis_Click" /><br />            
        <div id="porukaPromjene" runat="server"></div><br />
        <asp:SqlDataSource ID="sdsClanci" runat="server" ConnectionString="<%$ ConnectionStrings:acdcfanpage %>"
            DeleteCommand="DELETE FROM [Clanci] WHERE [ClanakID] = @ClanakID" InsertCommand="INSERT INTO [Clanci] ([NazivClanka], [TextClanka], [GalerijaID]) VALUES (@NazivClanka, @TextClanka, @GalerijaID)"
            SelectCommand="SELECT [Clanci].*,[Galerije].* FROM [Clanci] inner join [Galerije] on
                [Clanci].GalerijaID=[Galerije].GalerijaID and [Clanci].ClanakID=@ClanakID"
            UpdateCommand="UPDATE [Clanci] SET [NazivClanka] = @NazivClanka,  [GalerijaID] = @GalerijaID,[TextClanka]=@TextClanka WHERE [ClanakID] = @ClanakID">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlClanak" DefaultValue="1" Name="ClanakID" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="ClanakID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NazivClanka" Type="String" />
                <asp:Parameter Name="TextClanka" Type="String" />
                <asp:Parameter Name="GalerijaID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NazivClanka" Type="String" />
                <asp:Parameter Name="TextClanka" Type="String" />
                <asp:Parameter Name="GalerijaID" Type="Int32" />
                <asp:Parameter Name="ClanakID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsClanak" runat="server" ConnectionString="<%$ ConnectionStrings:acdcfanpage %>"
            SelectCommand="SELECT ClanakID,NazivClanka FROM [Clanci]"></asp:SqlDataSource>
        <div class="grid_container">
            <asp:DropDownList ID="ddlClanak" runat="server" DataSourceID="sdsClanak" DataTextField="NazivClanka"
                DataValueField="ClanakID" OnSelectedIndexChanged="ddlClanak_SelectedIndexChanged"
                AppendDataBoundItems="true" AutoPostBack="true">
            </asp:DropDownList>
            <br /><br />
            <asp:GridView ID="grdClanci" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ClanakID" DataSourceID="sdsClanci"
                BackColor="Black" CellPadding="10" ForeColor="White"  OnRowDeleted="grdClanci_RowDeleted" 
                OnRowUpdated ="grdClanci_RowUpdated"  re>
                <AlternatingRowStyle BackColor="gray" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowCancelButton="true" CancelText="Odustani"
                        DeleteText="Izbriši" EditText="Uredi" UpdateText="Potvrdi" >
                        <ItemStyle Font-Bold="True" />
                    </asp:CommandField>
                    <asp:BoundField DataField="ClanakID" HeaderText="ClanakID" ReadOnly="True" SortExpression="ClanakID" />
                    <asp:TemplateField HeaderText="Tekst članka" SortExpression="TextClanka">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("TextClanka") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <CKEditor:CKEditorControl ID="ftbClanak" runat="server" ClientIDMode="Static" Text='<%# Bind("TextClanka") %>'></CKEditor:CKEditorControl>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NazivClanka" HeaderText="Naziv članka" SortExpression="NazivClanka" />
                    <asp:BoundField DataField="GalerijaID" HeaderText="Galerija ID" SortExpression="GalerijaID" />
                    <asp:BoundField DataField="NazivGalerije" HeaderText="Naziv galerije" SortExpression="NazivGalerije" />
                </Columns>
                <HeaderStyle BackColor="Black" />
                <SelectedRowStyle BackColor="#006600" />
            </asp:GridView>
        </div>
    </div>
    <h2>Dodavanje novog članka</h2><br />
    <div id="dodavanjeClanka">
        <div class="grid_container">
            <div id="porukaOdodavanjuClanka" runat="server" style="text-align:center ; color:Red;"></div><br />
            <p>
                <asp:Label ID="lblNazivClanka" runat="server" Text="Naziv članka: "></asp:Label>
                <asp:TextBox ID="txtNazivClanka" runat="server" ValidationGroup="grupaDodajClanak"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ControlToValidate="txtNazivClanka" ForeColor="Red" ID="RequiredFieldValidator3"
                    runat="server" ErrorMessage="Morate upisati naziv članka" ValidationGroup="grupaDodajClanak"></asp:RequiredFieldValidator>
            </p>
            <h2>Unesite text članka</h2>
            <p><CKEditor:CKEditorControl runat="server" ID="ftbNoviClanak"></CKEditor:CKEditorControl></p>
            <p>
                <asp:Label ID="lbDodavanjeClanakalNazivGalerije" runat="server" Text="Naziv galerije: "></asp:Label>
                <asp:DropDownList ID="ddlNazivGalerije" runat="server" DataSourceID="sdsClanciGalerija"
                    DataTextField="NazivGalerije" DataValueField="GalerijaID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsClanciGalerija" runat="server" ConnectionString="<%$ ConnectionStrings:acdcfanpage %>"
                    SelectCommand="SELECT * FROM [Galerije]"></asp:SqlDataSource>
            </p>
            <p>
                <span>
                    <asp:Button ID="btnDodajClanak" runat="server" Text="Dodaj članak" ValidationGroup="grupaDodajClanak"
                        OnClick="btnDodajClanak_Click" CssClass="abtn" />
                </span>
            </p>
        </div>
    </div>
</asp:Content>
