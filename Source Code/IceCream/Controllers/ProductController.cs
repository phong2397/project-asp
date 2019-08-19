using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using IceCream.Models;

namespace IceCream.Controllers
{
    public class ProductController : Controller
    {
        PrjiceCreamEntities1 db = new PrjiceCreamEntities1();
       

        // GET: Product
        public ActionResult Book(int? page, string pName)
        {
            //get items from cate1 (medicine)
            var itemList = from t in db.Product
                           where (t.CateId.Equals(1))
                           orderby t.ProductId descending
                           select t;
            var model = itemList.ToList();
            if (!string.IsNullOrEmpty(pName))
            {
                //seartch by name
                model = model.Where(p => p.Name.ToUpper().Contains(pName)
                                    || p.Name.ToLower().Contains(pName)).ToList();
                //items in page
                int pageSize = 8;
                int pageNumber = (page ?? 1);
                return View(model.ToPagedList(pageNumber, pageSize));
            }
            else
            {
                //items in page
                int pageSize = 8;
                int pageNumber = (page ?? 1);   
                return View(model.ToPagedList(pageNumber, pageSize));
            }

        }

        



        public ActionResult ProductDetails(int id)
        {
            var model = db.Product.Find(id);
            //to take id from product details view
            Session["IdDetail"] = model.ProductId;
            if (model != null)
            {
                return View(model);
            }
            return View();
        }

        public ActionResult ContinueShopping()
        {
            return View();
        }
    }
}