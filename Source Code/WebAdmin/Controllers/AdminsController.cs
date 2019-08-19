using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebAdmin.Models;

namespace WebAdmin.Controllers
{
    public class AdminsController : Controller
    {
        private PrjiceCreamEntities db = new PrjiceCreamEntities();
       
        // GET: Admins/Index
        public ActionResult Index()
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            else
            {
                return View();
            }
        }

        // GET: Admins/Login
        public ActionResult Login()
        {
            return View();
        }

        // POST: Admins/Login
        [HttpPost]
        public ActionResult Login(Admin loginAdmin)
        {
            try
            {
                var admin = db.Admin.SingleOrDefault(a => a.Username.Equals(loginAdmin.Username));
                if (ModelState.IsValid)
                {
                    if (admin != null)
                    {

                        Session["aname"] = admin.Username;
                        if (admin.Password.Equals(loginAdmin.Password))
                        {
                            TempData["aName"] = admin;
                            return RedirectToAction("Index", "Admins");

                        }
                        else
                        {
                            ModelState.AddModelError("", "Invalid password...");
                        }
                    }
                    else
                    {
                        ModelState.AddModelError("", "Invalid username...");
                    }
                }
            }
            catch (Exception e)
            {

                ModelState.AddModelError("", e.Message);
            }
            return View();
        }

        // GET: Admins/Logout
        public ActionResult Logout()
        {
            Session["aname"] = null;
            Session.Abandon();
            return RedirectToAction("Login", "Admins");
        }

        // GET: Admins/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Admin admin = db.Admin.Find(id);
            if (admin == null)
            {
                return HttpNotFound();
            }
            return View(admin);
        }

        // POST: Admins/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Edit([Bind(Include = "Username,Password")] Admin admin)
        {
            if (ModelState.IsValid)
            {
                db.Entry(admin).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(admin);
        }

        // GET: Admins/CategorieIndex
        public ActionResult CategoryIndex(string cName)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            var model = db.Category.ToList();
            if (!string.IsNullOrEmpty(cName))
            {
                model = model.Where(p => p.Name.ToUpper().Contains(cName)
                                    || p.Name.ToLower().Contains(cName)).ToList();
                return View(model);
            }
            else
            {
                return View(model);
            }
        }

        // GET: Admins/CategoryDetails/5
        public ActionResult CategoryDetails(int? id)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Category.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // GET: Admins/CategoryCreate
        public ActionResult CategoryCreate()
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            return View();
        }

        // POST: Admins/CategoryCreate
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CategoryCreate([Bind(Include = "CateId,Name")] Category category)
        {
            if (ModelState.IsValid)
            {
                db.Category.Add(category);
                db.SaveChanges();
                return RedirectToAction("CategoryIndex");
            }

            return View(category);
        }

        // GET: Admins/CategoryEdit
        public ActionResult CategoryEdit(int? id)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Category.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Admins/CategoryEdit
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CategoryEdit([Bind(Include = "CateId,Name")] Category category)
        {
            if (ModelState.IsValid)
            {
                db.Entry(category).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("CategoryIndex");
            }
            return View(category);
        }

        // GET: Admins/CategoryDelete/id
        public ActionResult CategoryDelete(int id)
        {
            Category category = db.Category.Find(id);
            db.Category.Remove(category);
            db.SaveChanges();
            return RedirectToAction("CategoryIndex");
        }

        // GET: Admins/User index/id
        public ActionResult UserIndex(string uName)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            var model = db.Customer.ToList();
            if (!string.IsNullOrEmpty(uName))
            {
                model = model.Where(p => p.CustomerName.ToUpper().Contains(uName)
                                    || p.CustomerName.ToLower().Contains(uName)).ToList();
                return View(model);
            }
            else
            {
                return View(model);
            }
        }

        // GET: Admins/UserDetails/5
        public ActionResult UserDetails(int? id)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer user = db.Customer.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // GET: Admins/UserCreate
        public ActionResult UserCreate()
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            return View();
        }

        // POST: Admins/UserCreate
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UserCreate([Bind(Include = "CustomerId,CustomerEmail,CustomerPassword,CustomerName,CustomerAddress,CustomerPhone,DateRegister,CustomerRole")] Customer user)
        {
            if (ModelState.IsValid)
            {
                db.Customer.Add(user);
                db.SaveChanges();
                return RedirectToAction("UserIndex");
            }

            return View(user);
        }

        // GET: Admins/UserEdit/5
        public ActionResult UserEdit(int? id)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer user = db.Customer.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: Admins/UserEdit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UserEdit([Bind(Include = "CustomerId,CustomerEmail,CustomerPassword,CustomerName,CustomerAddress,CustomerPhone,DateRegister,CustomerRole")] Customer user)
        {
            if (ModelState.IsValid)
            {
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("UserIndex");
            }
            return View(user);
        }

        // GET: Admins/UserDelete/5
        public ActionResult UserDelete(int? id)
        {
            Customer user = db.Customer.Find(id);
            db.Customer.Remove(user);
            db.SaveChanges();
            return RedirectToAction("UserIndex");
        }


        // GET: Admins/FeedbackIndex
        public ActionResult FeedbackIndex(string fName)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            var feedbacks = db.FeedBack.Include(f => f.Customer);
            var model = feedbacks.ToList();
            if (!string.IsNullOrEmpty(fName))
            {
                model = model.Where(p => p.Customer.CustomerName.ToUpper().Contains(fName)
                                    || p.Customer.CustomerName.ToLower().Contains(fName)).ToList();
                return View(model);
            }
            else
            {
                return View(model);
            }



        }

        // GET: Admins/FeedbackDelete/5
        public ActionResult FeedbackDelete(int? id)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedBack feedback = db.FeedBack.Find(id);
            if (feedback == null)
            {
                return HttpNotFound();
            }
            return View(feedback);
        }

        // POST: Admins/FeedbackDelete/5
        [HttpPost, ActionName("FeedbackDelete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int? id)
        {
            FeedBack feedback = db.FeedBack.Find(id);
            db.FeedBack.Remove(feedback);
            db.SaveChanges();
            return RedirectToAction("FeedbackIndex");
        }

      


        // GET: Admins/ProductIndex
        public ActionResult ProductIndex(string pName)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            var products = db.Product.Include(p => p.Category).Include(p => p.Manufacture);
            var model = products.ToList();
            if (!string.IsNullOrEmpty(pName))
            {
                model = model.Where(p => p.Name.ToUpper().Contains(pName)
                                    || p.Name.ToLower().Contains(pName)).ToList();
                return View(model);
            }
            else
            {
                return View(model);
            }
        }

        // GET: Admins/ProductDetails/5
        public ActionResult ProductDetails(int? id)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Product.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Admins/ProductCreate
        public ActionResult ProductCreate()
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            ViewBag.CateId = new SelectList(db.Category, "CateId", "Name");
            ViewBag.ManuId = new SelectList(db.Manufacture, "ManuId", "Name");
            return View();
        }

        // POST: Admins/ProductCreate
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ProductCreate([Bind(Include = "ProductId,CateId,ManuId,Name,Type,Date,Price,Description,Image")]
                                                                                    Product product, HttpPostedFileBase file)
        {
            if (file.ContentLength > 0)
            {
                string pathFile = Path.GetFileName(file.FileName);
                string path = Path.Combine(Server.MapPath("/Images"), pathFile);
                file.SaveAs(path);
                product.Image = "/Images/" + pathFile;
            }
            if (ModelState.IsValid)
            {
                db.Product.Add(product);
                db.SaveChanges();
                return RedirectToAction("ProductIndex");
            }

            ViewBag.CateId = new SelectList(db.Category, "CateId", "Name", product.CateId);
            ViewBag.ManuId = new SelectList(db.Manufacture, "ManuId", "Name", product.ManuId);
            return View(product);
        }

        // GET: Admins/ProductEdit/5
        public ActionResult ProductEdit(int? id)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Product.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.CateId = new SelectList(db.Category, "CateId", "Name", product.CateId);
            ViewBag.ManuId = new SelectList(db.Manufacture, "ManuId", "Name", product.ManuId);
            return View(product);
        }

        // POST: Admins/ProductEdit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ProductEdit([Bind(Include = "ProductId,CateId,ManuId,Name,Type,Date,Price,Description,Image")]
                                                                                   Product product, HttpPostedFileBase file)
        {
            if (file.ContentLength > 0)
            {
                string pathFile = Path.GetFileName(file.FileName);
                string path = Path.Combine(Server.MapPath("/Images"), pathFile);
                file.SaveAs(path);
                product.Image = "/Images/" + pathFile;
            }
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ProductIndex");
            }

            ViewBag.CateId = new SelectList(db.Category, "CateId", "Name", product.CateId);
            ViewBag.ManuId = new SelectList(db.Manufacture, "ManuId", "Name", product.ManuId);
            return View(product);
        }

        // GET: Admins/ProductDelete/5
        public ActionResult ProductDelete(int id)
        {
            Product product = db.Product.Find(id);
            db.Product.Remove(product);
            db.SaveChanges();
            return RedirectToAction("ProductIndex");
        }
        // GET: Admins/OrderIndex
        public ActionResult OrderIndex(DateTime? dFrom, DateTime? dTo)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            var orders = db.Order.Include(o => o.Customer);
            var details = orders.Include(o => o.InvoiceDetailBook);
            if (!string.IsNullOrEmpty(dFrom.ToString()) && !string.IsNullOrEmpty(dTo.ToString()))
            {
                var model = details.ToList().Where(p => (p.OrderDate >= dFrom) && (p.OrderDate <= dTo));
                return View(model);
            }
            else
            {
                return View(details.ToList());
            }


        }
        public ActionResult ChangeStatus(int? id)
        {
            var model = db.Order.Find(id);
            if (model == null)
            {
                return HttpNotFound();
            }
            //Update all field to avoid errors
            //Phone number must be in valid format
            if (model.OrderStatus == true)
            {
                model.CustomerId = model.CustomerId;
                model.CustomerName = model.CustomerName;
                model.CustomerAddress = model.CustomerAddress;
                model.OrderDate = model.OrderDate;
                model.Payment = model.Payment;
                model.Total = model.Total;

                model.OrderStatus = false;
                db.SaveChanges();
            }
            else if (model.OrderStatus == false)
            {
                model.CustomerId= model.CustomerId;
                model.CustomerName = model.CustomerName;
                model.CustomerAddress = model.CustomerAddress;
                model.OrderDate = model.OrderDate;
                model.Payment = model.Payment;
                model.Total = model.Total;

                model.OrderStatus = true;
                db.SaveChanges();
            }

            return RedirectToAction("OrderIndex", "Admins");
        }
        // GET: Admins/OrderEdit/5
        public ActionResult OrderEdit(int? id)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
           Order order = db.Order.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
         
            return View(order);
        }

        // POST: Admins/OrderEdit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult OrderEdit([Bind(Include = "OrderId,CustomerId,OrderDate,Total")] Order order)
        {
            if (ModelState.IsValid)
            {
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("OrderIndex");
            }
 
            return View(order);
        }

        // GET: Adminss/OrderDetailIndex
        public ActionResult OrderDetailsIndex(int id)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            var orderDetails = db.InvoiceDetailBook.Include(o => o.Order).Include(o => o.Product);
            var model = orderDetails.ToList().Where(o => o.InvoiceId == id);
            return View(model);
        }
      
        public ActionResult ReIndex(string pName)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
           
            var model = db.Recipes.ToList();
            if (!string.IsNullOrEmpty(pName))
            {
                model = model.Where(p => p.Title.ToUpper().Contains(pName)
                                    || p.Title.ToLower().Contains(pName)).ToList();
                return View(model);
            }
            else
            {
                return View(model);
            }


        }

        public ActionResult RecipeDetails(int? id)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Recipes recipe = db.Recipes.Find(id);
            if (recipe == null)
            {
                return HttpNotFound();
            }
            return View(recipe);
        }

        // GET: Admins/UserCreate
        public ActionResult RecipeCreate()
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            return View();
        }

        // POST: Admins/UserCreate
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult RecipeCreate([Bind(Include = "Id,Title,Content,Imag,LinkYT,Status")] Recipes recipe)
        {
           
            if (ModelState.IsValid)
            {
                db.Recipes.Add(recipe);
                db.SaveChanges();
                return RedirectToAction("ReIndex");
            }

        
            return View(recipe);
        }

        // GET: Admins/UserEdit/5
        public ActionResult RecipeEdit(int? id)
        {
            if (Session["aname"] == null)
            {
                return RedirectToAction("Login", "Admins");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Recipes recipe = db.Recipes.Find(id);
            if (recipe == null)
            {
                return HttpNotFound();
            }
            return View(recipe);
        }

        // POST: Admins/UserEdit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult RecipeEdit([Bind(Include = "Id,Title,Content,Imag,LinkYT,Status")] Recipes recipe)
        {
          
            if (ModelState.IsValid)
            {
                db.Entry(recipe).State = EntityState.Modified;

                db.SaveChanges();
                return RedirectToAction("ReIndex");
            }
            return View(recipe);
        }

        // GET: Admins/UserDelete/5
        public ActionResult RecipeDelete(int? id)
        {
            Recipes recipe = db.Recipes.Find(id);
            db.Recipes.Remove(recipe);
            db.SaveChanges();
            return RedirectToAction("ReIndex");
        }


    }
}