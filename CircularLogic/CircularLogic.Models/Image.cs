using System.ComponentModel;
using Microsoft.Build.Framework;

namespace CircularLogic.Models
{
    public class Image
    {
        public int ImageID { get; set; }

        [Required]
        [DisplayName("Image Name")]
        public string Name { get; set; }

        [Required]
        [DisplayName("Image Link")]
        public string ImageData { get; set; }
    }
}