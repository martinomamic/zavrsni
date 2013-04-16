<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administracija.master" AutoEventWireup="true"
    CodeFile="AdministracijaDiskografije.aspx.cs" Inherits="Admin_AdministracijaDiskografije" %>

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
        <h2>Pregled i editiranje diskografije</h2><br />
        <asp:Button ID="btnPopisClanaka" runat="server" Text="Popis članaka" OnClick="btnPopisClanaka_Click" CssClass="abtn" />
        <asp:Button ID="btnMakniPopis" runat="server" Text="Makni popis" CssClass="abtn" OnClick="btnMakniPopis_Click" />
        <div id="porukaPromjene" runat="server"></div><br />
        <asp:SqlDataSource ID="sdsDiskografije" runat="server" ConnectionString="<%$ ConnectionStrings:acdcfanpage %>"
            DeleteCommand="DELETE FROM [Diskografije] WHERE [DiskografijaID] = @DiskografijaID" InsertCommand="INSERT INTO [Diskografije] ([Naziv], [Clanak], [GalerijaID]) VALUES (@Naziv, @Clanak, @GalerijaID)"
            SelectCommand="SELECT * FROM [Diskografije] WHERE [Diskografije].DiskografijaID=@DiskografijaID"
            UpdateCommand="UPDATE [Diskografije] SET [Naziv] = @Naziv,  [GalerijaID] = @GalerijaID, [Clanak]=@Clanak WHERE [DiskografijaID] = @DiskografijaID">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDiskografija" DefaultValue="1" Name="DiskografijaID"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="DiskografijaID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Naziv" Type="String" />
                <asp:Parameter Name="Clanak" Type="String" />
                <asp:Parameter Name="GalerijaID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Naziv" Type="String" />
                <asp:Parameter Name="GalerijaID" Type="Int32" />
                <asp:Parameter Name="DiskografijaID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsDiskografija" runat="server" ConnectionString="<%$ ConnectionStrings:acdcfanpage %>"
            SelectCommand="SELECT DiskografijaID,Naziv FROM [Diskografije]"></asp:SqlDataSource>
        <div class="grid_container">
            <asp:DropDownList ID="ddlDiskografija" runat="server" DataSourceID="sdsDiskografija"
                DataTextField="Naziv" DataValueField="DiskografijaID" OnSelectedIndexChanged="ddlDiskografija_SelectedIndexChanged"
                AppendDataBoundItems="True" AutoPostBack="True">
            </asp:DropDownList>
            <br />
            <asp:GridView ID="grdDiskografije" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataKeyNames="DiskografijaID" DataSourceID="sdsDiskografije" BackColor="Black"
                CellPadding="10" ForeColor="White" OnRowDeleted="grdDiskografije_RowDeleted" OnRowUpdated="grdDiskografije_RowUpdated">
                <AlternatingRowStyle BackColor="gray" />
                <Columns>
                    <asp:BoundField DataField="DiskografijaID" HeaderText="DiskografijaID" ReadOnly="True"
                        SortExpression="DiskografijaID" />
                    <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" />
                    <asp:TemplateField HeaderText="Članak" SortExpression="Članak">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Clanak") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <CKEditor:CKEditorControl ID="ftbClanak" runat="server" ClientIDMode="Static" Text='<%# Bind("Clanak") %>'></CKEditor:CKEditorControl>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="GalerijaID" HeaderText="GalerijaID" 
                        SortExpression="GalerijaID" />
                    <asp:CommandField CancelText="Poništi" DeleteText="Obriši" EditText="Uredi" 
                        ShowDeleteButton="True" ShowEditButton="True" UpdateText="Potvrdi" />
                </Columns>
                <HeaderStyle BackColor="Black" />
                <SelectedRowStyle BackColor="#006600" />
            </asp:GridView>
        </div>
    </div>
    <h2>Dodavanje novog članka</h2><br />
    <div id="dodavanjeClanka">
        <div class="grid_container">
            <div id="porukaOdodavanjuClanka" runat="server" style="text-align:center ; color:Red;">
            </div>
            <p>
                <asp:Label ID="lblNazivClanka" runat="server" Text="Naziv članka: "></asp:Label>
                <asp:TextBox ID="txtNazivClanka" runat="server" ValidationGroup="grupaDodajClanak"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ControlToValidate="txtNazivClanka" ForeColor="Red" ID="RequiredFieldValidator3"
                    runat="server" ErrorMessage="Morate upisati naziv članka" ValidationGroup="grupaDodajClanak"></asp:RequiredFieldValidator>
            </p>
            <h2>
                Unesite text članka
            </h2>
            <p>
                <CKEditor:CKEditorControl runat="server" ID="ftbNoviClanak"></CKEditor:CKEditorControl>
            </p>
            <p>
                <asp:Label ID="lbDodavanjeClanakalNazivGalerije" runat="server" Text="Naziv galerije: "></asp:Label>
                <asp:DropDownList ID="ddlNazivGalerije" runat="server" DataSourceID="sdsDiskografijeGalerija"
                    DataTextField="NazivGalerije" DataValueField="GalerijaID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsDiskografijeGalerija" runat="server" ConnectionString="<%$ ConnectionStrings:acdcfanpage %>"
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
