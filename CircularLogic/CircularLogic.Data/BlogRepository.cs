using CircularLogic.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CircularLogic.Data
{
    public class BlogRepository
    {
        private int AddACategory(Category category)
        {
            using (SqlConnection cn =
                new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "AddACategory";
                cmd.Parameters.AddWithValue("@Name", category.Name);

                SqlParameter outputParam = new SqlParameter("@CategoryID", SqlDbType.Int)
                {
                    Direction = ParameterDirection.Output
                };

                cmd.Parameters.Add(outputParam);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
                int categoryID = int.Parse(outputParam.SqlValue.ToString());
                return categoryID;
            }
        }

        private int AddABlogPost(BlogPost blogPost)
        {
            using (
                SqlConnection cn =
                    new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "AddABlog";
                cmd.Parameters.AddWithValue("@CategoryID", blogPost.Category.CategoryID);
                cmd.Parameters.AddWithValue("@UserID", blogPost.UserID);
                cmd.Parameters.AddWithValue("@Title", blogPost.Title);
                cmd.Parameters.AddWithValue("@TextBody", blogPost.HtmlContent);
                cmd.Parameters.AddWithValue("@UpdateTime", blogPost.UpdateTime);
                cmd.Parameters.AddWithValue("@CreationTime", blogPost.CreationTime);

                SqlParameter outputParam = new SqlParameter("@BlogID", SqlDbType.Int)
                {
                    Direction = ParameterDirection.Output
                };

                cmd.Parameters.Add(outputParam);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();

                int blogID = int.Parse(outputParam.SqlValue.ToString());
                return blogID;
            }
        }

        private int AddATag(Tag tag)
        {
            using (
                SqlConnection cn =
                    new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "AddATag";
                cmd.Parameters.AddWithValue("@Name", tag.Name);

                SqlParameter outputParam = new SqlParameter("@TagID", SqlDbType.Int)
                {
                    Direction = ParameterDirection.Output
                };

                cmd.Parameters.Add(outputParam);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();

                int tagID = int.Parse(outputParam.SqlValue.ToString());
                return tagID;
            }
        }

        private int AddAnImage(Image image)
        {
            using (
                SqlConnection cn =
                    new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "AddAnImage";
                cmd.Parameters.AddWithValue("@Name", image.Name);
                cmd.Parameters.AddWithValue("@ImageData", image.ImageData);

                SqlParameter outputParam = new SqlParameter("@ImageID", SqlDbType.Int)
                {
                    Direction = ParameterDirection.Output
                };

                cmd.Parameters.Add(outputParam);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();

                int imageID = int.Parse(outputParam.SqlValue.ToString());
                return imageID;
            }
        }

        private void BridgeBlogImage(int blogID, int imageID)
        {
            using (
                SqlConnection cn =
                    new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "BridgeBlogImage";
                cmd.Parameters.AddWithValue("@BlogID", blogID);
                cmd.Parameters.AddWithValue("@ImageID", imageID);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
        }

        private void BridgePostTag(int blogID, int tagID)
        {
            using (
                SqlConnection cn =
                    new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "BridgePostTag";
                cmd.Parameters.AddWithValue("@BlogID", blogID);
                cmd.Parameters.AddWithValue("@TagID", tagID);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
        }

        //Needs to return a new Blog??
        public BlogPost CreateBlogPost(BlogPost blogPost)
        {
            if (blogPost.Category.CategoryID == 0)
            {
                blogPost.Category.CategoryID = AddACategory(blogPost.Category);
            }

            blogPost.BlogPostID = AddABlogPost(blogPost);
            blogPost.Image.ImageID = AddAnImage(blogPost.Image);
            BridgeBlogImage(blogPost.BlogPostID, blogPost.Image.ImageID);

            //Not sure if this is a list? blogPost.Tag wouldn't work??
            foreach (Tag t in blogPost.Tags)
            {
                if (t.TagID == 0)
                {
                    t.TagID = AddATag(t);
                }
                BridgePostTag(t.TagID, blogPost.BlogPostID);
            }

            //returns the actual blog we just put everything in??
            return blogPost;
        }

        public BlogPost GetBlogPostByBlogID(int blogID)
        {
            BlogPost blogPost = new BlogPost();
            using (SqlConnection cn =
                new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "GetBlogPostByBlogPostID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@BlogID", blogID);

                cmd.Connection = cn;

                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        blogPost = BlogPostFromReader(dr);
                    }
                }
            }
            GetAllTagNameByBlogPostID(blogPost.BlogPostID);
            GetBlogImageByBlogID(blogPost.BlogPostID);
            return blogPost;
        }

        public Image GetBlogImageByBlogID(int blogID)
        {
            Image img = new Image();
            using (SqlConnection cn =
                new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "GetBlogImageByBlogID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@BlogID", blogID);

                cmd.Connection = cn;

                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        img = ImageFromReader(dr);
                    }
                }
            }
            return img;
        }

        public List<BlogPost> GetAllBlogPosts()
        {
            List<BlogPost> blogPosts = new List<BlogPost>();
            using (SqlConnection cn =
                new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "GetAllBlogs";
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Connection = cn;

                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        blogPosts.Add(BlogPostFromReader(dr));
                    }
                }
            }
            foreach (BlogPost blogPost in blogPosts)
            {
                blogPost.Tags = GetAllTagNameByBlogPostID(blogPost.BlogPostID);
                blogPost.Image = GetBlogImageByBlogID(blogPost.BlogPostID);
            }
            return blogPosts;
        }

        public List<Category> GetAllCategories()
        {
            List<Category> categoryList = new List<Category>();
            using (SqlConnection cn =
                new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "GetAllCategories";
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Connection = cn;

                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        categoryList.Add(CategoryFromReader(dr));
                    }
                }
            }
            return categoryList;
        }

        public List<Tag> GetAllTags()
        {
            List<Tag> tagList = new List<Tag>();
            using (SqlConnection cn =
                new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "GetAllTags";
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Connection = cn;

                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        tagList.Add(TagFromReader(dr));
                    }
                }
            }
            return tagList;
        }

        public List<BlogPost> GetAllBlogPostByCategoryID(int categoryID)
        {
            List<BlogPost> blogPosts = new List<BlogPost>();
            using (SqlConnection cn =
                new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "GetAllBlogPostByCategoryID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CategoryID", categoryID);

                cmd.Connection = cn;

                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        blogPosts.Add(BlogPostFromReader(dr));
                    }
                }
                foreach (BlogPost blogPost in blogPosts)
                {
                    blogPost.Tags = GetAllTagNameByBlogPostID(blogPost.BlogPostID);
                    blogPost.Image = GetBlogImageByBlogID(blogPost.BlogPostID);
                }
            }
            return blogPosts;
        }

        public List<BlogPost> GetAllBlogPostByTagID(int tagID)
        {
            List<BlogPost> blogPosts = new List<BlogPost>();
            using (SqlConnection cn =
                new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "GetAllBlogPostByTagID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TagID", tagID);

                cmd.Connection = cn;

                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        blogPosts.Add(BlogPostFromReader(dr));
                    }
                }
            }
            return blogPosts;
        }

        public List<Tag> GetAllTagNameByBlogPostID(int blogID)
        {
            List<Tag> tags = new List<Tag>();
            using (SqlConnection cn =
                new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "GetAllTagNameByBlogPostID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@BlogID", blogID);

                cmd.Connection = cn;

                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        tags.Add(TagFromReader(dr));
                    }
                }
            }
            return tags;
        }

        private BlogPost BlogPostFromReader(SqlDataReader dr)
        {
            BlogPost blogPost = new BlogPost();

            blogPost.BlogPostID = (int)dr["BlogPostID"];
            blogPost.Category.CategoryID = (int)dr["CategoryID"];
            blogPost.UserID = (string)dr["UserName"];
            blogPost.Title = (string)dr["Title"];
            blogPost.HtmlContent = (string)dr["TextBody"];
            blogPost.PostTime = dr["PostTime"] == DBNull.Value ? new DateTime() : (DateTime)dr["PostTime"];
            blogPost.Expiration = dr["ExpirationTime"] == DBNull.Value ? new DateTime() : (DateTime)dr["ExpirationTime"];
            blogPost.UpdateTime = (DateTime)dr["UpdateTime"];
            blogPost.CreationTime = (DateTime)dr["CreationTime"];
            blogPost.IsApproved = (bool)dr["IsApproved"];
            blogPost.Tags = GetAllTagNameByBlogPostID(blogPost.BlogPostID);
            blogPost.Image = GetBlogImageByBlogID(blogPost.BlogPostID);

            return blogPost;
        }

        private Tag TagFromReader(SqlDataReader dr)
        {
            Tag tag = new Tag();
            tag.TagID = (int)dr["TagID"];
            tag.Name = (string)dr["TagName"];
            return tag;
        }

        private Image ImageFromReader(SqlDataReader dr)
        {
            Image img = new Image();
            img.ImageID = (int)dr["ImageID"];
            img.ImageData = (string)dr["ImageData"];
            img.Name = (string)dr["Name"];
            return img;
        }

        private Category CategoryFromReader(SqlDataReader dr)
        {
            Category cat = new Category();
            cat.CategoryID = (int)dr["CategoryID"];
            cat.Name = (string)dr["CategoryName"];
            return cat;
        }

        public List<QueuedBP> GetAdminQueue()
        {
            List<QueuedBP> bps = new List<QueuedBP>();
            using (SqlConnection cn =
                new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "GetAdminQueue";
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Connection = cn;

                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        QueuedBP qbp = new QueuedBP();
                        qbp.BlogPostID = (int)dr["BlogPostID"];
                        int temp;
                        int.TryParse(dr["OrigBlogPostID"].ToString(), out temp);
                        qbp.OrigBlogPostID = temp;
                        qbp.NewBlogPostID = (int)dr["NewBlogPostID"];
                        qbp.QueueAction = (QueueAction)(int)dr["QueueActionID"];
                        qbp.ContentQueueID = (int)dr["ContentQueueID"];
                        qbp.UserID = (string)dr["UserID"];
                        qbp.Title = (string)dr["Title"];
                        qbp.CreationTime = (DateTime)dr["CreationTime"];
                        bps.Add(qbp);
                    }
                    return bps;
                }
            }
        }
    }
}