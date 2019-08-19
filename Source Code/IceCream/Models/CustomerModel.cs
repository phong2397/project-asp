using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IceCream.Models
{


    public class CustomerModel
    {
        static IceCreamDBData db = new IceCreamDBData();
        public static Customer GetCustomer(string email)
        {
            return db.Customers.FirstOrDefault(c => c.CustomerEmail == email);
        }
        public static bool AddCus(Customer newCus)
        {
            var b = db.Customers.Where(c => c.CustomerEmail == newCus.CustomerEmail);
            if (b.Count() == 0)
            {
                db.Customers.InsertOnSubmit(newCus);
                db.SubmitChanges();
                return true;
            }
            return false;
        }
        public static Customer GetCustomers(int? id)
        {
            return db.Customers.First(c => c.CustomerId == id);
        }
        public static bool EditProfile(Customer editpro)
        {
            var b = GetCustomer(editpro.CustomerEmail);
            if (b != null)
            {
                b.CustomerName = editpro.CustomerName;
                b.CustomerPhone = editpro.CustomerPhone;
                b.CustomerAddress = editpro.CustomerAddress;
                db.SubmitChanges();
                return true;
            }
            return false;
        }
        public static bool EditPassword(Customer editpass)
        {
            var b = GetCustomer(editpass.CustomerEmail);
            if (b != null)
            {
                b.CustomerPassword = editpass.CustomerPassword;
                db.SubmitChanges();
                return true;
            }
            return false;
        }
        public static bool editrole(Customer editrole)
        {
            var b = GetCustomer(editrole.CustomerEmail);
            if (b != null)
            {
                b.CustomerRole = editrole.CustomerRole;
                db.SubmitChanges();
                return true;
            }
            return false;
        }
    }
}