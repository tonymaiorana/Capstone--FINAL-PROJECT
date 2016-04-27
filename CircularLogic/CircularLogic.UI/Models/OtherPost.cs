using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CircularLogic.Models;

namespace CircularLogic.UI.Models
{
    public class OtherPost
    {
        public int id { get; set; }
        public string Type { get; set; }
        public Category Category { get; set; }
    }
}