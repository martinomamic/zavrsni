using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    Admin a;
    protected void Page_Load(object sender, EventArgs e)
    {
            
        neuspjelo_logiranje.InnerText = "";
        a = new Admin();
        if (Session["loggedIn"] == null)
        {
            login.Visible = true;
            sadrzaj.Visible = false;
            btnodlogirajSe.Visible = false;
        }
        else
        {
            login.Visible = false;
            sadrzaj.Visible = true;
            btnodlogirajSe.Visible = true;
        }
    }
    protected void btnLogirajSe_Click(object sender, EventArgs e)
    {
        Boolean flag = a.LogirajSe(txtKorisnickoIme.Text, txtLozinka.Text);
        if (flag)
        {
            Session["loggedIn"] = true;
            login.Visible = false;
            sadrzaj.Visible = true;
            btnodlogirajSe.Visible = true;
        }
        else
        {
            neuspjelo_logiranje.InnerText = "Neuspjelo logiranje, pokušajte ponovno";
        }
    }
    protected void odlogirajSe_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        login.Visible = true;
        sadrzaj.Visible = false;
        btnodlogirajSe.Visible = false;

    }
}

