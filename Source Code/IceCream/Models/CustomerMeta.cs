using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace IceCream.Models
{
    [MetadataType(typeof(CustomerMeta))]
    public partial class Customer
    {

    }
    public class CustomerMeta
    {       
            [Key]
            public int CustomerId { get; set; }
            [Required]
            [Display(Name ="Email")]
            [DataType(DataType.EmailAddress)]
            public string CustomerEmail { get; set; }
            [Required]
            [Display(Name = "Password")]
            [DataType(DataType.Password)]
            [StringLength(50, MinimumLength = 6)]
            public string CustomerPassword { get; set; }
            [Required]
            [Display(Name = "Name")]
            [StringLength(50, MinimumLength = 3)]
            public string CustomerName { get; set; }
            [Required]
            [Display(Name = "Phone Number")]
            [StringLength(10)]
            [RegularExpression("[0-9]{10}")]
            public string CustomerPhone { get; set; }
            [Required]
            [Display(Name ="Address")]
            [StringLength(100)]
            public string CustomerAddress { get; set; }
            [DataType(DataType.DateTime)]
            [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
            public DateTime DateRegister { get; set; }
            public byte CustomerRole { get; set; }
        
    }
}