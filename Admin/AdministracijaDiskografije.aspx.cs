using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdministracijaDiskografije : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        porukaPromjene.InnerText = "";
        porukaOdodavanjuClanka.InnerText = "";
        if (!IsPostBack)
        {
            grdDiskografije.Visible = false;
            btnMakniPopis.Visible = false;
            btnPopisClanaka.Visible = true;
            ddlDiskografija.Visible = false;
            ddlDiskografija.Items.Clear();
            OsvjeziPodatke();

            
        }

        else
        {
            grdDiskografije.Visible = true;
            ddlDiskografija.Visible = true;
            btnMakniPopis.Visible = true;
            btnPopisClanaka.Visible = false;
        }

    }


    protected void btnDodajClanak_Click(object sender, EventArgs e)
    {

        Admin a = new Admin();
        try
        {
            a.DodajClanakUDiskografiju(txtNazivClanka.Text, ftbNoviClanak.Text, Int32.Parse(ddlNazivGalerije.SelectedValue));
            ddlDiskografija.Items.Clear();
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
        sdsDiskografije.DataBind();
        sdsDiskografijeGalerija.DataBind();
        grdDiskografije.DataBind();
        ddlDiskografija.DataBind();
    }

    protected void btnPopisClanaka_Click(object sender, EventArgs e)
    {
        grdDiskografije.Visible = true;
        btnMakniPopis.Visible = true;
        btnPopisClanaka.Visible = false;
        ddlDiskografija.Visible = true;

    }
    protected void btnMakniPopis_Click(object sender, EventArgs e)
    {
        grdDiskografije.Visible = false;
        btnPopisClanaka.Visible = true;
        btnMakniPopis.Visible = false;
        ddlDiskografija.Visible = false;
    }
    protected void ddlDiskografija_SelectedIndexChanged(object sender, EventArgs e)
    {

        grdDiskografije.Visible = true;
        btnMakniPopis.Visible = true;
        btnPopisClanaka.Visible = false;
        ddlDiskografija.Visible = true;


    }

    protected void grdDiskografije_RowDeleted(Object sender, GridViewDeletedEventArgs e)
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
        ddlDiskografija.Items.Clear();
        OsvjeziPodatke();

    }

    protected void grdDiskografije_RowUpdated(Object sender, GridViewUpdatedEventArgs e)
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