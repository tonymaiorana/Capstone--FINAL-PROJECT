using System;

namespace CircularLogic.Models
{
    public class StaticPage
    {
        public int StaticID { get; set; }
        public string Title { get; set; }
        public string TextBody { get; set; }
        public string RouteValue { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime UpdateTime { get; set; }
        public DateTime? CreationTime { get; set; }
        public DateTime? DeleteTime { get; set; }
        public string Image { get; set; }
    }
}