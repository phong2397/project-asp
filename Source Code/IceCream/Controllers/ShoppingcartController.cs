using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using IceCream.Models;
using PagedList;

namespace IceCream.Controllers
{
    public class ShoppingcartController : Controller
    {
        private PrjiceCreamEntities1 db = new PrjiceCreamEntities1();
        static IceCreamDBData tc = new IceCreamDBData();

        // GET: Shoppingcart
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult OrderNow(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (Session["cart"] == null)
            {
                List<Cart> lsCart = new List<Cart>
                {
                    new Cart(db.Product.Find(id),1)

                };
                Session["cart"] = lsCart;
            }
            else
            {
                List<Cart> lsCart = (List<Cart>)Session["cart"];
                int check = IsExistCheck(id);
                if (check == -1)
                {
                    lsCart.Add(new Cart(db.Product.Find(id), 1));

                }
                else
             
                lsCart[check].Quantity++;
                Session["cart"] = lsCart;

            }

            return View("Index");
        }

        public int IsExistCheck(int? id)
        {
            List<Cart> lsCart = (List<Cart>)Session["cart"];
            for (int i = 0; i < lsCart.Count; i++)
            {
                if (lsCart[i].Product.ProductId == id)
                    return i;

            }
            return -1;
        }
        //This method enables customer to update the number of product that they want
        public ActionResult UpdateQuantity(int? id, int newQuantity)
        {
            // Find out Cart Item that want to edit
            List<Cart> cartShop = Session["cart"] as List<Cart>;
            Cart itemUpdate = cartShop.FirstOrDefault(m => m.Product.ProductId == id);
            if (itemUpdate != null)
            {
                itemUpdate.Quantity = newQuantity;
            }
            return RedirectToAction("Index");

        }

        //This method that is used to remove item from cart

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            int check = IsExistCheck(id);
            List<Cart> lsCart = (List<Cart>)Session["cart"];
            lsCart.RemoveAt(check);
            return RedirectToAction("Index", "ShoppingCart");
        }
       

        public ActionResult Payment(FormCollection frc,int? cusid)
        {
            List<Cart> Cart = (List<Cart>)Session["cart"];
            if (Session["id"] == null)
            {
                cusid = null;
            }
            else
            {
                cusid = Convert.ToInt32(frc["cusID"]);
            }
            try
            {
                if (Cart != null)
                {
                    
                    Order invoice = new Order()
                    { 
                        //CustomerId = Convert.ToInt32(frc["cusID"]),
                        CustomerId = cusid,
                        OrderDate = DateTime.Now,
                        Total = Convert.ToInt32(frc["cusTotal"]),
                        CustomerName = frc["customerName"],
                        CustomerAddress = frc["customerAddress"],
                        Payment = frc["payment"],
                       
                
                    };
                    if (invoice == null)
                    {
                        ModelState.AddModelError("", "Customer Name or Address is required!");
                    }

                    db.Order.Add(invoice);
                    db.SaveChanges();
                    Session["InvoiceId"] = invoice.InvoiceId;

                    // End the saving process into Order table.

                    foreach (Cart cart in Cart)
                    {
                        //Start saving data into OrderDetails table the database
                        InvoiceDetailBook detail = new InvoiceDetailBook();

                        detail.InvoiceId = invoice.InvoiceId;
                        detail.ProductId = cart.Product.ProductId;
                        detail.Price = cart.Product.Price;
                        detail.Quantity = cart.Quantity;
                        detail.SubTotal = cart.Quantity * cart.Product.Price;


                        db.InvoiceDetailBook.Add(detail);
                        db.SaveChanges();
                        //End the saving process into OrderDetails table
                    }
                    //check in usercart
                    //Remove Session["cart"] to continue the next order's customer
                    Session.Remove("cart");
                    //after cart has been cleaned , turn id into null
         
                    return RedirectToAction("Order", "Shoppingcart");
                }

                else
                {
                    ModelState.AddModelError("", "You need to add item !");
                }

            }
            catch (Exception e)
            {
                ModelState.AddModelError("", e.Message);
            }
            return View("Index");





        }
        public PartialViewResult Shipping()
        {
            if (Session["email"] != null)
            {
                var user = Session["email"].ToString();
                var model = CustomerModel.GetCustomer(user);
                if (model != null)
                {
                    return PartialView(model);
                }
            }
            return PartialView();
        }
        public ActionResult Order()
        {

            int id = (int)Session["InvoiceId"];
            var model = db.Order.Find(id);
            return View(model);
        }


        public ActionResult Checkout()
        {
            return View();
        }

        //View order recipe
        public ActionResult OrderDetails(int id)
        {
            var model = (from a in db.Order
                         join b in db.InvoiceDetailBook
                         on a.InvoiceId equals b.InvoiceId
                         join c in db.Product
                         on b.ProductId equals c.ProductId
                         where a.InvoiceId == id
                         select new UserOrderDetail
                         {
                             InvoiceId = a.InvoiceId,
                             CustomerId = a.CustomerId,
                             OrderStatus = a.OrderStatus,
                             CustomerAddress = a.CustomerAddress,
                             CustomerName = a.CustomerName,
                             OrderDate = a.OrderDate,
                             Total = a.Total,
                             ProductId = c.ProductId,
                             CateId = c.CateId,
                             ManuId = c.ManuId,
                             Name = c.Name,
                             Image = c.Image,
                             InvoiceDetailId = b.InvoiceDetailId,
                             Price = b.Price,
                             Quantity = b.Quantity,
                             SubTotal= b.SubTotal,
                      

                       }).ToList();



            return View(model);
        }

        public ActionResult Orderhistory(int? page)
        {
            int id = Convert.ToInt32(Session["id"]);
            var itemList = from t in db.Order
                           where t.CustomerId == id
                           orderby t.InvoiceId descending
                           select t;
            var model = itemList.ToList();

            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return View(model.ToPagedList(pageNumber, pageSize));
        }
    }
}




    
