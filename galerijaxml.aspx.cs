using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class galerijaxml : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Korisnik k = new Korisnik();
        int id;
        if ((Request.QueryString["id"] == null) || !(Int32.TryParse(Request.QueryString["id"], out id)))
        {
        }
        else
        {
            string str = k.KreirajXmlZaGaleriju(k.LinkoviNaSlike(id));
            Response.ContentType = "text/xml";
            Response.Write(str);
        }
    }
}