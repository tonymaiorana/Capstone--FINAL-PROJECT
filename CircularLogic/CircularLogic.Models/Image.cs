using System.ComponentModel;

namespace CircularLogic.Models
{
    public class Image
    {
        public int ImageID { get; set; }

        [DisplayName("Image Name")]
        public string Name { get; set; }

        [DisplayName("Image Link")]
        public string ImageData { get; set; }
    }
}