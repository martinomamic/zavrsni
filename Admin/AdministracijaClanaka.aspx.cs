using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using thunderstruckModel;

public partial class Admin_AdministracijaClanaka : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

        porukaPromjene.InnerText = "";
        porukaOdodavanjuClanka.InnerText = "";
        if (!IsPostBack)
        {
            grdClanci.Visible = false;
            btnMakniPopis.Visible = false;
            btnPopisClanaka.Visible = true;
            ddlClanak.Visible = false;
            ddlClanak.Items.Clear();
            OsvjeziPodatke();          
        }

        else
        {

            grdClanci.Visible = true;
            ddlClanak.Visible = true;
            btnMakniPopis.Visible = true;
            btnPopisClanaka.Visible = false;
        }
        
    }
    protected void btnDodajClanak_Click(object sender, EventArgs e)
    {

        Admin a = new Admin();
        try
        {
            a.DodajClanak(txtNazivClanka.Text, ftbNoviClanak.Text, Int32.Parse(ddlNazivGalerije.SelectedValue));
            ddlClanak.Items.Clear();

        }
        catch (Exception ex)
        {
            porukaOdodavanjuClanka.InnerText = ex.Message;
        }
        OsvjeziPodatke();
        porukaOdodavanjuClanka.InnerText = "Članak dodan u bazu";
    }
    protected void OsvjeziPodatke()
    {
        sdsClanci.DataBind();
        sdsClanciGalerija.DataBind();
        grdClanci.DataBind();
        ddlClanak.DataBind();   
    }
    protected void btnPopisClanaka_Click(object sender, EventArgs e)
    {
        grdClanci.Visible = true;
        btnMakniPopis.Visible = true;
        btnPopisClanaka.Visible = false;
        ddlClanak.Visible = true;

    }
    protected void btnMakniPopis_Click(object sender, EventArgs e)
    {
        grdClanci.Visible = false;
        btnPopisClanaka.Visible = true;
        btnMakniPopis.Visible = false;
        ddlClanak.Visible = false;
    }
    protected void ddlClanak_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        grdClanci.Visible = true;
        btnMakniPopis.Visible = true;
        btnPopisClanaka.Visible = false;
        ddlClanak.Visible = true;
    }

   protected void grdClanci_RowDeleted(Object sender, GridViewDeletedEventArgs e)
    {

        if (e.Exception == null)
        {
            porukaPromjene.InnerText = "Uspješno obrisano";
        }
        else
        {
            porukaPromjene.InnerText = "Dogodila se greška pri brisanju";
            e.ExceptionHandled = true;
        }
        ddlClanak.Items.Clear();
        OsvjeziPodatke ();

    }

    protected void grdClanci_RowUpdated(Object sender, GridViewUpdatedEventArgs e)
    {

        if (e.Exception == null)
        {
            porukaPromjene.InnerText = "Uspješno promijenjeno";
        }
        else
        {
            porukaPromjene.InnerText = "Dogodila se greška";
            e.ExceptionHandled = true;
        }       

    }

}