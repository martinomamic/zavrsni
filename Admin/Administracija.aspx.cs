using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Administracija : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        porukaODodavanju.InnerText = "";
    }
    protected void btnDodajAdministratora_Click(object sender, EventArgs e)
    {
        Admin a = new Admin();
        try
        {
            a.DodajAdministratora(txtKorisnickoIme.Text, txtSifra.Text);
            porukaODodavanju.InnerText = "Administrator dodan u bazu";
            sdsPopisAdministratora.DataBind();
            grdPopisAdministratora.DataBind();

        }
        catch (Exception ex)
        {
            porukaODodavanju.InnerText = ex.Message;
        }
    }

}