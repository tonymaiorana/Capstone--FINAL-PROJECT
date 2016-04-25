using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CircularLogic.UI.Models
{
    public class AllowDeny
    {
        public int[] allowedBP { get; set; }
        public int[] deniedBP { get; set; }
    }
}