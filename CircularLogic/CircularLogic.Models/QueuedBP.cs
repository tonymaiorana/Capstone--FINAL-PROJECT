using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CircularLogic.Models
{
    public class QueuedBP
    {
        public int BlogPostID { get; set; }
        public string Title { get; set; }
        public string UserID { get; set; }
        public DateTime? CreationTime { get; set; }
        public int ContentQueueID { get; set; }
        public int OrigBlogPostID { get; set; }
        public int NewBlogPostID { get; set; }
        public QueueAction QueueAction { get; set; }
    }
}
