using System;

namespace CircularLogic.Models
{
    public class Comment
    {
        public int CommentID { get; set; }
        public int BlogID { get; set; }
        public string TextBody { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateUpdated { get; set; }
        public DateTime IsDeleted { get; set; }
    }
}