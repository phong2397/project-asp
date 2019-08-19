using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IceCream.Models
{
    public class Status
    {
        public static IEnumerable<SelectListItem> GetStatusList()
        {
            var b = new List<SelectListItem>
            {
                new SelectListItem{Value="Free", Text="Free"},
                new SelectListItem{Value="VIP", Text="VIP"}
            };
            return b;
        }
    }
}