using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CircularLogic.Models
{
    public class TagCloudTag
    {
        public int TagCloudID { get; set; }
        public string Name { get; set; }
        public int Weight { get; set; }
    }
}