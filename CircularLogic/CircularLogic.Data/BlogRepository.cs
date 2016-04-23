using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CircularLogic.Models;

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
        public BlogPost CreateBlogPost (BlogPost blogPost)
        {
            if (blogPost.Category.CategoryID == 0)
            {
                blogPost.Category.CategoryID = AddACategory(blogPost.Category);
            }

            blogPost.BlogPostID = AddABlogPost(blogPost);
            blogPost.Image.ImageID = AddAnImage(blogPost.Image);
            BridgeBlogImage(blogPost.BlogPostID, blogPost.Image.ImageID);

            //Not sure if this is a list? blogPost.Tag wouldn't work??
            foreach (Tag t in new List<Tag>())
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
    }
}
