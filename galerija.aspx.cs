using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class galerija : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Korisnik k=new Korisnik();
        try
        {
            Title=k.NazivGalerije(Int32.Parse(Request.QueryString["id"])) + " Galerija";
        }
        catch
        {
            
        }
      
    }
}