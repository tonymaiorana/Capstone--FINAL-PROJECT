using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using CircularLogic.Data;
using NUnit.Framework;
using CircularLogic.Models;
using NUnit.Framework.Constraints;

namespace CircularLogic.Tests
{
    [TestFixture]
    public class RepoTests
    {
        private BlogRepository _repo = new BlogRepository();
        public string _cns = @"Data Source=.\SQL2014; Initial Catalog=CircularLogicTest;User ID=sa;Password=sqlserver;";
        [SetUp]
        public void Setup()
        {
            using (SqlConnection cn = new SqlConnection(_cns))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "DAC";
                cmd.Connection = cn;
                cn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        [Test]
        public void AddACategory_Test()
        {

            var expectedCategory = new Category()
            {
                Name = "TestCategory",
                Color = "ff69f2"
            };
            int actual = _repo.AddACategory(expectedCategory);
            Assert.AreEqual(actual, 12);
        }

        [Test]
        public void UpdateACategory_Test()
        {
            var expectedUpdate = new Category()
            {
                Color = "ff69f2",
                CategoryID = 2,
            };
            _repo.UpdateACategory(expectedUpdate);
            Category actual = _repo.GetAllCategories().FirstOrDefault(c => c.CategoryID == 2);
            Assert.AreEqual(expectedUpdate.Color, actual.Color);
        }

        [Test]
        public void EditABlogPost_Test()
        {
            BlogPost expectedBlogPost = _repo.GetBlogPostByBlogID(2);
            expectedBlogPost.IsApproved = true;
            expectedBlogPost.Title = "Test the testing features of the test";
            _repo.EditABlogPost(expectedBlogPost);
            BlogPost actual = _repo.GetBlogPostByBlogID(22);
            Assert.AreEqual(expectedBlogPost.Title, actual.Title);
        }

        [Test]
        public void DeleteABlog_Test()
        {
            BlogPost expectBlogPost = _repo.GetBlogPostByBlogID(4);
            _repo.DeleteABlog(4, true);
            BlogPost testBlogPost = _repo.GetAllBlogPosts().FirstOrDefault(b => b.BlogPostID == 4);
            Assert.IsNotNull(expectBlogPost);
            Assert.IsNull(testBlogPost);
        }

        [Test]
        public void CreateBlogPost_Test()
        {
            BlogPost testBlogPost = new BlogPost()
            {
                Category = new Category()
                {
                    CategoryID = 2,
                },
                Title = "TestTitle",
                CreationTime = DateTime.Now,
                UpdateTime = DateTime.Now,
                HtmlContent = "This is a test, had it been the real thing you'd be in serious trouble",
                Image = new Image()
                {
                    ImageData = "sadlkfjasdlfasdfasd",
                    Name = "TestImage"
                },
                IsApproved = true,
                Tags = new List<Tag>(),
                UserID = "025bee71-8da8-447a-bf41-e09e601a6a60"

            };
            _repo.CreateBlogPost(testBlogPost);
            _repo.GetBlogPostByBlogID(testBlogPost.BlogPostID);
            Assert.IsNotNull(testBlogPost);
        }

        //[Test]
        //public void GetBlogPostByBlogID_Test()
        //{
        //    BlogPost expectedBlogPost = new BlogPost()
        //    {
        //        BlogPostID = 2,
        //    };
        //    BlogPost actual = _repo.GetAllBlogPosts().FirstOrDefault(b => b.BlogPostID == 2);
        //    Assert.AreEqual(expectedBlogPost.BlogPostID, actual.BlogPostID);
        //}

        [Test]
        public void GetBlogImageByBlogID_Test()
        {
            BlogPost expectedBlogPost = new BlogPost()
            {
                BlogPostID = 1,
                Image = new Image()
                {
                    ImageData = "http://standrewscitychurch.com/wp-content/uploads/2015/12/Testing.gif",
                    Name = "Test",
                    ImageID = 1
                    
                }
            };

           BlogPost actual = _repo.GetBlogPostByBlogID(1);
            Assert.AreEqual(expectedBlogPost.Image.ImageID, actual.Image.ImageID);

        }
    }
}
