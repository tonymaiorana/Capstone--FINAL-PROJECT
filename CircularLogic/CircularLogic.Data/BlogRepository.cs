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
        public int AddACategory(Category category)
        {
            using (SqlConnection cn =
                new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "AddACategory";
                cmd.Parameters.AddWithValue("@Description", category.Description);

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

        public int AddABlogPost(BlogPost blogPost)
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
                if (blogPost.Category.CategoryID == 0)
                {
                    AddACategory(blogPost.Category);
                }
                return blogID;
            }
        }

        public int AddATag(Tag tag)
        {
            using (
                SqlConnection cn =
                    new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "AddATag";
                cmd.Parameters.AddWithValue("@Description", tag.Name);

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

        public int AddAnImage(Image image)
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

        public void BridgeBlogImage(int blogID, int imageID)
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

        public void BridgePostTag(int blogID, int tagID)
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
    }
}
