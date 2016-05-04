using Microsoft.Build.Framework;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace CircularLogic.Models
{
    public class BlogPost
    {
        public BlogPost()
        {
            Category = new Category();
            Tags = new List<Tag>();
        }

        public int BlogPostID { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string UserID { get; set; }

        public DateTime? PostTime { get; set; }
        public DateTime? Expiration { get; set; }
        public DateTime CreationTime { get; set; }
        public DateTime UpdateTime { get; set; }

        [DisplayName("Tags")]
        public List<Tag> Tags { get; set; }

        public bool IsApproved { get; set; }

        [DisplayName("Blog Body Content")]
        [Required]
        [AllowHtml]
        public string HtmlContent { get; set; }

        public Image Image { get; set; }
        public Category Category { get; set; }
        public int Viewed { get; set; }
    }
}