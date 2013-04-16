using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using thunderstruckModel;
using AjaxControlToolkit;

public partial class diskografija : System.Web.UI.Page
{
    Korisnik k;
    Diskografije dis;
    

    protected void Page_Load(object sender, EventArgs e)
    {
      
        k = new Korisnik();
        if (Request.QueryString["index"] == null)
            Acc1.SelectedIndex = -1;
        else
            Acc1.SelectedIndex = Int32.Parse(Request .QueryString ["index"]);


        if (Request.QueryString["id"] == null)
        {
            btnBack.Visible = false;
            try
            {
                dis = k.DData(1);
                sadrzaj.InnerHtml = dis.Clanak;
                Title = "AC/DC fan page - " + dis.Naziv;
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
                    dis = k.DData(Int32.Parse(Request.QueryString["id"]));
                    sadrzaj.InnerHtml = dis.Clanak;
                    Title = "AC/DC fan page - " + dis.Naziv;
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
