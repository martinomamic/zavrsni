<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administracija.master" AutoEventWireup="true" CodeFile="Administracija.aspx.cs" Inherits="Admin_Administracija" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/admin.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/menu.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Popis administratora</h2><br />
    <div id="popisAdministratora">
        <asp:SqlDataSource ID="sdsPopisAdministratora" runat="server" ConnectionString="<%$ ConnectionStrings:acdcfanpage %>"
            DeleteCommand="DELETE FROM [Administrator] WHERE [AdministratorID] = @AdministratorID"
            InsertCommand="INSERT INTO [Administrator] ([Username], [Password]) VALUES (@username, @password)"
            SelectCommand="SELECT * FROM [Administrator]" 
            UpdateCommand="UPDATE [Administrator] SET [Username] = @username, [Password] = @password WHERE [AdministratorID] = @AdministratorID">
            <DeleteParameters>
                <asp:Parameter Name="AdministratorID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="AdministratorID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="grdPopisAdministratora" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="Black" DataKeyNames="AdministratorID"
            DataSourceID="sdsPopisAdministratora" ForeColor="White">
            <AlternatingRowStyle BackColor="Gray" ForeColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" DeleteText="Izbriši"/>
                <asp:BoundField DataField="AdministratorID" HeaderText="AdministratorID"
                    ReadOnly="True" SortExpression="AdministratorID" />
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            </Columns>
            <HeaderStyle BackColor="Black" />
        </asp:GridView>
        <div id="poruka" runat="server" ></div>
    </div>
    <h2>
        Dodaj administratora</h2>
    <div id="dodajAdministratora">
        <asp:Label ID="lblKorisnickoIme" runat="server" Text="Korisničko ime :" ClientIDMode="Static"></asp:Label>
        <div id="txt1Okvir">
            <asp:TextBox CssClass="text1" ID="txtKorisnickoIme" runat="server" ClientIDMode="Static"
                ValidationGroup="validacija"></asp:TextBox>
        </div>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Korisničko ime je obavezno"
            Font-Bold="True" ValidationGroup="validacija" ControlToValidate="txtKorisnickoIme"
            ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblSifra" runat="server" Text="Šifra :" ClientIDMode="Static"></asp:Label>
        <div id="txt2Okvir">
            <asp:TextBox CssClass="text2" ID="txtSifra" runat="server" ClientIDMode="Static"
                ValidationGroup="validacija" TextMode="Password"></asp:TextBox>
        </div>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Šifra je obavezna"
            Font-Bold="True" ValidationGroup="validacija" ControlToValidate="txtKorisnickoIme"
            ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="btnDodajAdministratora" runat="server" Text="Dodaj Administratora"
            ClientIDMode="Static" ValidationGroup="validacija" OnClick="btnDodajAdministratora_Click" />
        <div id="porukaODodavanju" runat="server" class="porukaODodavanju">
        </div>
    </div>
</asp:Content>

