    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IceCream.Models;

namespace IceCream.Controllers
{
    public class ContactController : Controller
    {
        PrjiceCreamEntities1 db = new PrjiceCreamEntities1();
        // GET: Contact
        public ActionResult Contact()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Contact([Bind(Include = "FeedbackId,Subject,Content,CustomerId")] FeedBack feedback)
        {
            if (Session["id"] == null)
            {
                feedback.CustomerId = null;
            }
            else
            {
                feedback.CustomerId = Convert.ToInt32(Session["id"]);
            }
            if (ModelState.IsValid)
            {
                db.FeedBack.Add(feedback);
                db.SaveChanges();
                ViewBag.msg = "Thank You For Your Contact.";
             

            }
           
            return View();
        }
    }
}