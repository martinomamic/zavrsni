using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdministracijaSlika : System.Web.UI.Page
{
    Admin admin;
    protected void Page_Load(object sender, EventArgs e)
    {
        admin = new Admin();
        porukaGalerije.InnerText = "";
        btnMakniPopis.Visible = false;


    }
    protected void btnPopisGalerija_Click(object sender, EventArgs e)
    {
        grdGalerija.Visible = true;
        btnMakniPopis.Visible = true;
        btnPopisGalerija. Visible = false;

    }

    /// <summary>
    /// Praznjenje svih kontrola za dodavanje thumbnaila
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnOdustani_Click(object sender, EventArgs e)
    {
        txtSirinaThumbnaila.Text = null;
        txtVisinaThumbnaila.Text = null;
        ftbOpisThumbnaila.Text = null;
    }

    /// <summary>
    /// Dodavanje zapisa o thumbnailu u bazu i dodavanje thumbnaila i eventualno slike koja ide uz njega
    /// fizicki na disk
    /// U slucaju greske prilikom dodavanja u bazu ili na disk salje se poruka
    /// Dođe li do greske kod dodavanja u bazu dodana datoteka se brise fizicki sa diska
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnDodaj_Click(object sender, EventArgs e)
    {
        string linkNaVelikuSl = null;
        string thumbnailLink = "Pics/Galerije/" + ddlNazivGalerije.SelectedItem.Text + "/" + FileUpload1.FileName;
        if (FileUpload2.HasFile)
        {
            linkNaVelikuSl = "Pics/Galerije/" + ddlNazivGalerije.SelectedItem.Text + "/" + FileUpload2.FileName;
        }

        try
        {
            admin.SpremiSlikuNaDisk("Thunderstruck/Pics/Galerije/" + ddlNazivGalerije.SelectedItem.Text, FileUpload1);
            if (FileUpload2.HasFile)
                admin.SpremiSlikuNaDisk("Thunderstruck/Pics/Galerije/" + ddlNazivGalerije.SelectedItem.Text, FileUpload2);
        }
        catch (Exception ex)
        {
            porukaODodavanju.InnerText = ex.Message;
        }

        try
        {
            admin.DodajThumbnail(FileUpload1.FileName, thumbnailLink, linkNaVelikuSl, Int32.Parse(txtSirinaThumbnaila.Text), ftbOpisThumbnaila.Text, Int32.Parse(txtVisinaThumbnaila.Text), Int32.Parse(ddlNazivGalerije.SelectedValue));
        }
        catch (Exception ex)
        {
            porukaODodavanju.InnerText = ex.Message;
        }

        OsvjeziPodatke();
        porukaODodavanju.InnerText = "Datoteke i zapis uspješno dodani";
    }

    protected void OsvjeziPodatke()
    {
        sdsDodajThumbGalerije.DataBind();
        sdsGalerija.DataBind();
        sdsgalerijaThumbnails.DataBind();
        ddlNazivGalerije.DataBind();
        grdDetaljiGalerija.DataBind();
        grdGalerija.DataBind();

    }
    protected void btnDodajGaleriju_Click(object sender, EventArgs e)
    {
        admin.DodajGaleriju(txtDodajGaleriju.Text);
        OsvjeziPodatke();
    }

    protected void btnMakniPopis_Click(object sender, EventArgs e)
    {

        grdGalerija.Visible = false;
        grdDetaljiGalerija.Visible = false;
        btnPopisGalerija.Visible = true;
        btnPopisSlika.Visible = true;

    }
    protected void btnPopisSlika_Click(object sender, EventArgs e)
    {
        grdDetaljiGalerija.Visible = true;
        btnMakniPopis.Visible = true;
        btnPopisSlika.Visible = false;
        
    }

    protected void grdGalerija_PageIndexChanged(object sender, EventArgs e)
    {
        btnMakniPopis.Visible = true;
        btnPopisSlika.Visible = true;
    }
    protected void grdDetaljiGalerija_PageIndexChanged(object sender, EventArgs e)
    {
        btnMakniPopis.Visible = true;
        btnPopisGalerija.Visible = true;
    }

    /// <summary>
    /// Aktivira se klikom na gumb za brisanje retka u tablici s popisom galerija
    /// ako je checkbox u istom retku checkiran u tom slucaju se brisu i fizicki datoteke thumbnailova i/ili slika
    /// na disku
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grdGalerija_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if ((string)e.CommandArgument == "Obrisi")
        {
            try
            {
                int index = Int32.Parse(e.CommandArgument.ToString());
                GridViewRow r = grdGalerija.Rows[index];
                int galerijaid = Int32.Parse(r.Cells[1].Text);
                CheckBox chk = (CheckBox)r.FindControl("cbBrisi");
                Boolean b = chk.Checked;
                admin.BrisiGaleriju(galerijaid, b);
            }
            catch
            {
                porukaGalerije.InnerText = "Dogodila se greška prilikom brisanja galerije";
            }
            OsvjeziPodatke();
            porukaGalerije.InnerText = "Galerija uspješno izbrisana";
        }
    }

}