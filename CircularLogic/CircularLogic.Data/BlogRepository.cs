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
                cmd.Parameters.AddWithValue("@CategoryID", blogPost.Category);
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

        public List<Tag> GetAllTagNameByBlogID(int blogID)
        {
            List<Tag> tags = new List<Tag>();
            using (SqlConnection cn =
                new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "GetAllTagNameByBlogID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@BlogPostID", blogID);

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
            blogPost.Title = (string)dr["Title"];
            blogPost.HtmlContent = (string)dr["TextBody"];
            blogPost.PostTime = (DateTime)dr["PostTime"];
            blogPost.Expiration = (DateTime)dr["ExpirationTime"];
            blogPost.UpdateTime = (DateTime)dr["UpdateTime"];
            blogPost.CreationTime = (DateTime)dr["CreationTime"];
            blogPost.IsApproved = (bool)dr["IsApproved"];
            TagFromReader(dr);
            return blogPost;
        }

        private Tag TagFromReader(SqlDataReader dr)
        {
            Tag tag = new Tag();
            tag.TagID = (int)dr["TagID"];
            tag.Name = (string)dr["TagName"];
            return tag;
        }
    }
}