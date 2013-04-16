using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using thunderstruckModel;

/// <summary>
/// Summary description for Admin
/// </summary>
public class Admin
{

    
    thunderstruckEntities ent;
    public Admin()
    {
        //
        // TODO: Add constructor logic here
        //

        ent = new thunderstruckEntities();
    }
    /// <summary>
    /// Dodaje novu galeriju u bazu
    /// </summary>
    /// <param name="nazivGalerije"></param>
    public void DodajGaleriju(string nazivGalerije)
    {
        Galerije g = new Galerije();
        g.NazivGalerije = nazivGalerije;
        g.GalerijaID = maxID(g) + 1;
        ent.Galerije.AddObject(g);
        ent.SaveChanges();

    }
    /// <summary>
    /// Dodaje thumbnail u galeriju slika
    /// </summary>
    /// <param name="nazivThumbnaila">Naziv thumbnaila</param>
    /// <param name="link">Link na thumbnail</param>
    /// <param name="linkNaVelikuSliku">Link na veliku sliku koja se otvara klikom na thumbnail,
    /// moze biti i null
    /// </param>
    /// <param name="sirina"></param>
    /// <param name="dodatniHtml">Dodatni Html opis koji ide uz thumbnail </param>
    /// <param name="visina"></param>
    /// <param name="galerijaId">id galerije slika kojoj ce thumbnail pripadati</param>
    public void DodajThumbnail(string nazivThumbnaila, string link, string linkNaVelikuSliku, int sirina, string dodatniHtml, int visina, int galerijaId)
    {
        Thumbnail t = new Thumbnail();
        t.NazivThumbnaila = nazivThumbnaila;
        t.Link = link;
        t.LinkNaVelikuSliku = linkNaVelikuSliku;
        t.Sirina = sirina;
        t.DodatniHtml = dodatniHtml;
        t.Visina = visina;
        t.GalerijaID = galerijaId;
        t.ThumbnailID = maxID(t) + 1;
        try
        {
            ent.Thumbnail.AddObject(t);
            ent.SaveChanges();
        }
        catch (Exception)
        {
            throw new Exception("Dodavanje zapisa o thumbnailu u bazu nije uspjelo");
        }
    }
    /// <summary>
    /// Metoda za logiranje administratora 
    /// </summary>
    /// <param name="username"></param>
    /// <param name="password"></param>
    /// <returns></returns>
    public Boolean LogirajSe(string username, string password)
    {
        SHA256 sh = new SHA256Managed();
        //string pass = System.Text.Encoding.UTF8.GetString(sh.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password)));
        string pass = password;
        var user = from u in ent.Administrator
                   where u.Username == username
                           && u.Password == pass
                   select u;

        if (user.Count() == 0)
        {
            return false;
        }
        return true;
    }
    /// <summary>
    /// Sprema odgovarajucu sliku fizicki na disk
    /// </summary>
    /// <param name="virtualnaPunaStaza">Puna virtualna staza na koju se sprema slika,bez naziva same slike</param>
    /// <param name="fileUploadKontrola">File upload kontrola pomocu koje se vrsi upload</param>
    public void SpremiSlikuNaDisk(string virtualnaPunaStaza, FileUpload fileUploadKontrola)
    {
        if (!fileUploadKontrola.HasFile)
            throw new IOException("File upload kontrola je prazna");

        string directoryPath = HttpContext.Current.Server.MapPath(virtualnaPunaStaza);
        string filePath = HttpContext.Current.Server.MapPath(virtualnaPunaStaza + "/" + fileUploadKontrola.FileName);

        if (!Directory.Exists(directoryPath))
        {
            Directory.CreateDirectory(directoryPath);
        }

        fileUploadKontrola.SaveAs(filePath);
    }

    public void IzbrisiSlikuSaDiska(string virtualnaPunaStaza)
        {
                try
                {
                        string fullPath = HttpContext.Current.Server.MapPath(virtualnaPunaStaza);
                        File.Delete(fullPath);
                }
                catch (Exception ex)
                {
                        throw ex;
                }
        }


    /// <summary>
    /// Brise galeriju sa zadanim id-em i sve thumbnailove koji pripadaju toj galeriji
    /// Ako je parametar slike true u tom slucaju brisu se i slike fizicki sa diska, te sadrzajni
    /// direktorij
    /// </summary>
    /// <param name="galerijaID"></param>
    public void BrisiGaleriju(int galerijaID, Boolean slike)
    {
        var th = from t in ent.Thumbnail
                 join g in ent.Galerije
                 on t.GalerijaID equals g.GalerijaID
                 where t.GalerijaID == galerijaID
                 select t;

        var v = from e in ent.Galerije
                where e.GalerijaID == galerijaID
                select e;

        foreach (Thumbnail thmb in th)
        {
            ent.Thumbnail.DeleteObject(thmb);
            if (slike)
            {

                string path = HttpContext.Current.Server.MapPath(thmb.Link);
                File.Delete(path);
                if (thmb.LinkNaVelikuSliku != null)
                {
                    path = HttpContext.Current.Server.MapPath(thmb.LinkNaVelikuSliku);
                    File.Delete(path);
                }

                Directory.Delete(HttpContext.Current.Server.MapPath(@"Pics/Galerije/" + v.First().NazivGalerije));
            }
        }

        ent.SaveChanges();

        foreach (Galerije g in v)
        {
            ent.Galerije.DeleteObject(g);
        }
        ent.SaveChanges();
    }
    /// <summary>
    /// Dodaje clanak u bazu
    /// </summary>
    /// <param name="nazivClanka"></param>
    /// <param name="textClanka"></param>
    /// <param name="galerijaid"></param>
    public void DodajClanak(string nazivClanka, string textClanka, int galerijaid)
    {
        Clanci cl = new Clanci();
        cl.NazivClanka = nazivClanka;
        cl.TextClanka = textClanka;
        cl.GalerijaID = galerijaid;
        cl.ClanakID = maxID(cl) + 1;


        try
        {
            ent.Clanci.AddObject(cl);
            ent.SaveChanges();

        }
        catch
        {
            throw new Exception("Dodavanje clanka nije uspjelo");
        }
    }
    /// <summary>
    /// Dodaje članak u diskografiju
    /// </summary>
    /// <param name="nazivClanka"></param>
    /// <param name="textClanka"></param>
    /// <param name="galerijaid"></param>
    public void DodajClanakUDiskografiju(string nazivClanka, string textClanka, int galerijaid)
    {
        Diskografije dis = new Diskografije();
        dis.Naziv = nazivClanka;
        dis.Clanak = textClanka;
        dis.GalerijaID = galerijaid;
        dis.DiskografijaID = maxID(dis) + 1;


        try
        {
            ent.Diskografije.AddObject(dis);
            ent.SaveChanges();

        }
        catch
        {
            throw new Exception("Dodavanje clanka nije uspjelo");
        }
    }
    /// <summary>
    /// Dodaje administratora , password se šifrira 
    /// </summary>
    /// <param name="username"></param>
    /// <param name="password"></param>
    public void DodajAdministratora(string username, string password)
    {
        try
        {
            Administrator a = new Administrator();
            a.Username = username;
            SHA256 sha = new SHA256Managed();
            string pass = System.Text.Encoding.UTF8.GetString(sha.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password)));
            a.Password = pass;
            a.AdministratorID = maxID(a) + 1;
            ent.Administrator.AddObject(a);
            ent.SaveChanges();
            
        }
        catch
        {
            throw new Exception("Greška kod dodavanja administratora");
        }

    }
    /// <summary>
    /// Brise administratora sa zadanim id-em
    /// </summary>
    /// <param name="a"></param>
    public void BrisiAdministratora(int id)
    {
        var ad = from a in ent.Administrator
                 where a.AdministratorID == id
                 select a;

        foreach (Administrator a in ad)
        {
            ent.Administrator.DeleteObject(a);
        }
            ent.SaveChanges();
 
    }

    public int maxID(Administrator a)
    {
        var id = from e in ent.Administrator
                 orderby e.AdministratorID descending
                 select e.AdministratorID;
        return id.First();
    }
    public int maxID(Clanci a)
    {
        var id = from e in ent.Clanci
                 orderby e.ClanakID descending
                 select e.ClanakID;
        return id.First();
    }
    public int maxID(Thumbnail a)
    {
        var id = from e in ent.Thumbnail
                 orderby e.ThumbnailID descending
                 select e.ThumbnailID;
        return id.First();
    }
    public int maxID(Galerije a)
    {
        var id = from e in ent.Galerije
                 orderby e.GalerijaID descending
                 select e.GalerijaID;
        return id.First();
    }
    public int maxID(Diskografije a)
    {
        var id = from e in ent.Diskografije
                 orderby e.DiskografijaID descending
                 select e.DiskografijaID;
        return id.First();
    }

    

}
