using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
using System.IO;
using System.Xml;
using thunderstruckModel;
using System.Data.Objects;
using System.Data.Objects.DataClasses;

/// <summary>
/// Summary description for Korisnik
/// </summary>
public class Korisnik
{
   
    public string nepostojecaStranica;

    thunderstruckEntities entiteti;
	public Korisnik()
	{
		//
		// TODO: Add constructor logic here
		//

        entiteti = new thunderstruckEntities();
        nepostojecaStranica = "<p style='font-size:1.2em;'>Nepostojeća stranica ili stranica u izradi</p>";
	}
   

    public int ClanakID(string nazivClanka)
    {
        var id = from c in entiteti.Clanci
                 where c.NazivClanka == nazivClanka
                 select c.ClanakID;
        return id.First();
    }

    public Clanci Data(int id)
    {
        var str = from c in entiteti.Clanci
                  where c.ClanakID == id
                  select c;
        return str.First();
    }

    public Clanci Data()
    {
        var str = from c in entiteti.Clanci
                 orderby c.ClanakID descending
                  select c;
        return str.First();
    }

    public Diskografije DData(int id)
    {
        var str = from c in entiteti.Diskografije
                  where c.DiskografijaID == id
                  select c;
        return str.First();
    }

    public Diskografije DData()
    {
        var str = from c in entiteti.Diskografije
                  orderby c.DiskografijaID descending
                  select c;
        return str.First();
    }


   
    public List<string> GalerijaLinkovi(int id)
    {
        var gal_id = GalerijaID(id);

        var sl = from t in entiteti.Thumbnail
                 where t.GalerijaID == gal_id
                 select t.LinkNaVelikuSliku;
        return (List<string>)sl;
    }


    public List<string> GalerijaLinkovi()
    {
        var gal_id = GalerijaID();

        var sl = from t in entiteti.Thumbnail
                 where t.GalerijaID == gal_id
                 select t.LinkNaVelikuSliku;
        return (List<string>)sl;
    }


    public string KreirajXmlZaGaleriju(List<string> links)
    {
        string naslov = "";
        string opis = "";
        string str;

        str = @"<?xml version='1.0' encoding='utf-8' ?><data startalbumindex='0'  transition='CrossFadeTransition'><album>";                                                                                             
        int i = 0;
        foreach (string link in links)
        {
            i++;          
            naslov = Naslov(link);
            //opis = Opis(link);
            str += @"<slide image='" + link + "' title='" + naslov +  /*"' description='" + opis +*/ "' />";
        }
        str += @" </album></data>";
        return str;
    }

    /// <summary>
    /// vraca id galerije za clana sa proslijedjenim id-em
    /// </summary>
    /// <param name="bioid"></param>
    /// <returns></returns>
    public int GalerijaID(int id)
    {
        var gid = from d in entiteti.Clanci 
                     where d.ClanakID == id
                     select d.GalerijaID;
        return (int)gid.First();
    }

    public int GalerijaID()
    {
        var gid = from d in entiteti.Clanci 
                     orderby d.ClanakID descending
                     select d.GalerijaID;
        return (int)gid.First();
    }

    public string Naslov(string s)
    {
        var n = from t in entiteti.Thumbnail
                where t.LinkNaVelikuSliku == s
                select t.NazivThumbnaila;
        return (string)n.First();
    }

    public string Opis(string s)
    {
        var o = from t in entiteti.Thumbnail
                where t.LinkNaVelikuSliku == s
                select t.DodatniHtml;
        if (o.Count() > 0)
            return (string)o.First();

        else
            return "";
    }


    /// <summary>
    /// Vraca popis linkova na slike za odgovarajucu galeriju
    /// </summary>
    /// <param name="gid"></param>
    /// <returns></returns>
    public List<string> LinkoviNaSlike(int gid)
    {
        var list = from t in entiteti.Thumbnail
                   where t.GalerijaID == gid
                   select t.LinkNaVelikuSliku;
        return list.Where(x => x != null).ToList();
    }

    public string NazivGalerije(int gid)
    {
        var naz = from d in entiteti.Galerije
                  join g in entiteti.Clanci
                  on d.GalerijaID equals g.GalerijaID
                  where d.GalerijaID == gid
                  select d.NazivGalerije;
        return naz.First().ToString();

    }


}