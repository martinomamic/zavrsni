using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using thunderstruckModel;

public partial class biografija : System.Web.UI.Page
{
    Korisnik k;
    Clanci bio;
    protected void Page_Load(object sender, EventArgs e)
    {
        k = new Korisnik();
        if (Request.QueryString["id"] == null)
        {
            btnBack.Visible = false;
            try
            {
                bio = k.Data(1);
                sadrzaj.InnerHtml = bio.TextClanka;
                Title = "AC/DC fan page - " + bio.NazivClanka;
                btnGalerija.HRef = "galerija.aspx?id=" + k.GalerijaID(1);  
            }
            catch
            {
                sadrzaj.InnerHtml = k.nepostojecaStranica;
            }
        }
        else
        {
            int id;
            bool val = Int32.TryParse(Request.QueryString["id"], out id);
            if (val)
            {
                try
                {
                    bio = k.Data(Int32.Parse(Request.QueryString["id"]));
                    sadrzaj.InnerHtml = bio.TextClanka;
                    Title = "AC/DC fan page - " + bio.NazivClanka;
                    btnGalerija.HRef = "galerija.aspx?id=" + k.GalerijaID(Int32.Parse(Request.QueryString["id"]));                  
                }
                catch
                {
                    sadrzaj.InnerHtml = k.nepostojecaStranica;
                }
            }
            else
                sadrzaj.InnerHtml = k.nepostojecaStranica;
        }

    }

}