using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IceCream.Models
{
    public class UserOrderDetail
    {
        public int InvoiceId { get; set; }
        public Nullable<int> CustomerId { get; set; }
        public DateTime OrderDate { get; set; }
        public string CustomerName { get; set; }
        public string CustomerAddress{ get; set; }
        public bool OrderStatus { get; set; }
        public int Total { get; set; }
        public int ProductId { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
        public double SubTotal { get; set; }
        public int CateId { get; set; }
        public int ManuId { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
        public int InvoiceDetailId { get; set; }
       

    }
}