using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IceCream.Models;

namespace IceCream.Controllers
{
    public class HomeController : Controller
    {
       
        // GET: cua tien

        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(Customer logcus,Customer editrole)
        {
            if (logcus.CustomerEmail == null || logcus.CustomerPassword == null)
            {
                ModelState.AddModelError("", "Please enter your email and password!!");
            }
            else
            {
                var b = CustomerModel.GetCustomer(logcus.CustomerEmail);
                if (b == null)
                {
                    ModelState.AddModelError("", "Email incorret");
                    return View();
                }
                else
                {

                if (b.CustomerEmail == logcus.CustomerEmail && b.CustomerPassword == logcus.CustomerPassword)
                {

                    DateTime dateregis = Convert.ToDateTime(b.DateRegister);
                    
                    if (b.CustomerRole == 1)
                    {                      
                        DateTime datenew = dateregis.AddMonths(1);
                        DateTime datenow = DateTime.Today;
                        int comparedate = DateTime.Compare(datenow, datenew);                                             
                        if (comparedate > 0)
                        {
                            
                            editrole.CustomerEmail = logcus.CustomerEmail;
                            editrole.CustomerRole = 0;
                            b.CustomerRole = 0;
                            CustomerModel.editrole(editrole);
                        }
                    }
                    if (b.CustomerRole == 2)
                    {
                        DateTime datenew = dateregis.AddYears(1);
                        DateTime datenow = DateTime.Today;
                        int comparedate = DateTime.Compare(datenow, datenew);
                        if (comparedate > 0)
                        {
                            editrole.CustomerEmail = logcus.CustomerEmail;
                            editrole.CustomerRole = 0;
                            b.CustomerRole = 0;
                            CustomerModel.editrole(editrole);
                        }
                    }
                    Session["email"] = b.CustomerEmail;
                    Session["password"] = b.CustomerPassword;
                    Session["role"] = b.CustomerRole;
                    Session["id"] = b.CustomerId;
                    return RedirectToAction("Book","Product");

                }
                else
                {
                    ModelState.AddModelError("", "login fall");
                }
                }
            }           
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(Customer newcus,string checkregis,string duration)
        {
            string email = newcus.CustomerEmail;
            newcus.CustomerRole = 0;
            newcus.DateRegister = DateTime.Today;
            if (ModelState.IsValid)
            {
                if (checkregis == "checked")
                {
                    if (duration == "month")
                    {
                        newcus.CustomerRole = 1;
                    }
                    if (duration == "year")
                    {
                        newcus.CustomerRole = 2;
                    }
                }
                else
                {
                    newcus.CustomerRole = 0;
                }
                
                if (CustomerModel.AddCus(newcus))
                {
                    Session["email"] = newcus.CustomerEmail;
                    Session["password"] = newcus.CustomerPassword;
                    Session["role"] = newcus.CustomerRole;
                    Session["id"] = newcus.CustomerId;
                    return RedirectToAction("Index");
                }
                ModelState.AddModelError("", "Email already existed!!");
            }
            return View();
        }
        public ActionResult Logout()
        {
            Session["email"] = null;
            Session["password"] = null;
            Session["role"] = null;
            Session["id"] = null;
            return RedirectToAction("Index");
        }
        public ActionResult Profiles(string email)
        {
            if (Session["email"] != null)
            {
                email = Session["email"].ToString();
                return View(CustomerModel.GetCustomer(email));
            }
            return RedirectToAction("Login");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Profiles(Customer editpro)
        {
            ModelState.Remove("CustomerId");
            ModelState.Remove("CustomerRole");
            ModelState.Remove("DateRegister");
            ModelState.Remove("CustomerPassword");
            if (ModelState.IsValid)
            {
                if (CustomerModel.EditProfile(editpro))
                {
                    ModelState.AddModelError("","Update Successful!!");
                    return View();
                }
                ModelState.AddModelError("", "can't update");         
            }
            return View();
            
        }
        public ActionResult ChangePassWord()
        {
            if (Session["email"] != null)
            {
                return View();
            }
            return RedirectToAction("Login");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassWord(Customer editpass,string newpassword,string repassword)
        {
            ModelState.Remove("CustomerId");
            ModelState.Remove("CustomerRole");
            ModelState.Remove("DateRegister");
            ModelState.Remove("CustomerName");
            ModelState.Remove("CustomerAddress");
            ModelState.Remove("CustomerPhone");
            ModelState.Remove("CustomerEmail");
           editpass.CustomerEmail = Session["email"].ToString();
            if (newpassword != repassword)
            {
                ModelState.AddModelError("","Incorrect re-password");
            }
            else
            {
                if (ModelState.IsValid)
                {
                    if (editpass.CustomerPassword == Session["password"].ToString())
                    {

                        editpass.CustomerPassword = newpassword;
                        if (CustomerModel.EditPassword(editpass))
                        {
                            Session["password"] = newpassword;
                            ModelState.AddModelError("", "Update Successful!!");
                            return View();
                        }
                        ModelState.AddModelError("", "Incorrect Old Password!!");
                    }
                    ModelState.AddModelError("", "Can't Update!!");
                }
            }
            
            return View();
        }
        public ActionResult RegisterMember()
        {
            if (Session["email"] != null)
            {
                return View();
            }
            return RedirectToAction("Login");
        }
        [HttpPost]
        public ActionResult RegisterMember(Customer editro,string duration)
        {
            editro.CustomerEmail = Session["email"].ToString();
            if (duration == "month")
            {
                editro.CustomerRole = 1;
                Session["role"] = 1;
            }
            if (duration == "year")
            {
                editro.CustomerRole = 2;
                Session["role"] = 1;
            }
            if (CustomerModel.editrole(editro))
            {
                return RedirectToAction("RegisterMember");
            }
            ModelState.AddModelError("", "Can't Register");
            return View();
            
        }

        ////////////////////////////////////////////////////////////////////////////////////////////////
        ///


        RecipeDataDataContext db = new RecipeDataDataContext();

        public ActionResult FreeRecipes()
        {
            
            GetRecipes();
            return View(db.Recipes);
        }

        public ActionResult FullRecipes()
        {
            if (Session["email"] == null)
            {
                return RedirectToAction("Login");
            }
            if (int.Parse(Session["role"].ToString()) == 0)
            {
                return RedirectToAction("RegisterMember");
            }
            GetRecipes();
            return View(db.Recipes);
        }

        public ActionResult RecipeDetails(int id)
        {
            return View(Get(id));
        }


        public ActionResult Index()
        {
            return View();
        }

        public IEnumerable<Recipe> GetRecipes()
        {
            return db.Recipes;
        }
        public Recipe Get(int id)
        {
            return db.Recipes.SingleOrDefault(item => item.Id == id);

        }


        public ActionResult Create()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Create(Recipe newRec)
        {
            if (Get(newRec.Id) == null)
            {
                db.Recipes.InsertOnSubmit(newRec);
                db.SubmitChanges();
                return RedirectToAction("Index");
            }
            return View();
        }

        public ActionResult Edit(int id)
        {
            return View(Get(id));
        }

        [HttpPost]
        public ActionResult Edit(Recipe editRec)
        {
            var e = Get(editRec.Id);
            if (e != null)
            {
                e.Title = editRec.Title;
                e.Content = editRec.Content;
                e.Imag = editRec.Imag;
                e.LinkYT = editRec.LinkYT;
                e.Status = editRec.Status;

                db.SubmitChanges();

                return RedirectToAction("Index");
            }

            return View();
        }


        public ActionResult Delete(int id)
        {
            var e = Get(id);
            if (e != null)
            {
                db.Recipes.DeleteOnSubmit(e);
                db.SubmitChanges();
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }
    }
}