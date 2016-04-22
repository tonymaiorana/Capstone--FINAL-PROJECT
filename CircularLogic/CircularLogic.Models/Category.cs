using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CircularLogic.Models
{
    public class Category
    {
        public int CategoryID { get; set; }
        public string Description { get; set; }
        public bool IsDeleted { get; set; }
    }
}