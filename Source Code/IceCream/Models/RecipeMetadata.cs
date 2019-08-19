using System.ComponentModel.DataAnnotations;

namespace IceCream.Models
{
    public class RecipeMetadata
    {
        
        public int Id { get; set; }

        [Required]
        [StringLength(100, MinimumLength = 10)]
        public string Title { get; set; }

        [Required]
        [StringLength(90, MinimumLength = 30)]
        public string Content { get; set; }

        [Required]
        public string Imag { get; set; }

        [Required]
        public string LinkYT { get; set; }


        public string Status { get; set; }
    }
}