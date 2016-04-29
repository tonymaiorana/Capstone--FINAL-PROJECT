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
    public class StaticPageRepository
    {

        public int AddAStaticPage(StaticPage newStaticPage)
        {
            using (
                SqlConnection cn =
                    new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "AddAStaticPage";
                cmd.Parameters.AddWithValue("@Title", newStaticPage.Title);
                cmd.Parameters.AddWithValue("@TextBody", newStaticPage.HtmlContent);
                cmd.Parameters.AddWithValue("@UpdateTime", newStaticPage.UpdateTime);
                cmd.Parameters.AddWithValue("@CreationTime", newStaticPage.CreationTime);

                SqlParameter outputParam = new SqlParameter("@StaticPageID", SqlDbType.Int)
                {
                    Direction = ParameterDirection.Output
                };

                cmd.Parameters.Add(outputParam);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();

                int staticID = int.Parse(outputParam.SqlValue.ToString());

                if (newStaticPage.Image != null)
                {
                    newStaticPage.Image.ImageID = AddAnImage(newStaticPage.Image, staticID);
                }

                return staticID;
            }
        }

        public StaticPage UpdateAStaticPage(StaticPage staticPage)
        {
            StaticPage updatedStaticPage = new StaticPage();

            using (
                SqlConnection cn =
                    new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "UpdateAStaticPage";
                cmd.Parameters.AddWithValue("@StaticPageID", staticPage.StaticID);
                cmd.Parameters.AddWithValue("@Title", staticPage.Title);
                cmd.Parameters.AddWithValue("@TextBody", staticPage.HtmlContent);
                cmd.Parameters.AddWithValue("@UpdateTime", staticPage.UpdateTime);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();

                if (staticPage.Image != null)
                {
                    UpdateAnImage(staticPage.Image, staticPage.StaticID);
                }

                return updatedStaticPage;
            }
        }

        public StaticPage GetStaticPageByStaticPageID(int staticPageID)
        {
            StaticPage staticPage = new StaticPage();
            using (SqlConnection cn =
                new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "GetStaticPageByStaticPageID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StaticPageID", staticPageID);

                cmd.Connection = cn;

                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        staticPage = StaticPageFromReader(dr);
                    }
                }
            }

            return staticPage;
        }

        private StaticPage StaticPageFromReader(SqlDataReader dr)
        {
            StaticPage staticPage = new StaticPage();

            staticPage.StaticID = (int) dr["StaticPageID"];
            staticPage.Title = (string) dr["Title"];
            staticPage.HtmlContent = (string) dr["TextBody"];
            staticPage.UpdateTime = (DateTime) dr["UpdateTime"];
            staticPage.CreationTime = (DateTime) dr["CreationTime"];
            staticPage.Image = GetStaticImageByStaticID(staticPage.StaticID);

            return staticPage;
        }

        private Image GetStaticImageByStaticID(int staticID)
        {
            Image img = new Image();
            using (SqlConnection cn =
                new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "GetStaticImageByStaticPageID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StaticPageID", staticID);

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

        private Image ImageFromReader(SqlDataReader dr)
        {
            Image img = new Image();
            img.ImageID = (int) dr["ImageID"];
            img.ImageData = (string) dr["ImageData"];
            img.Name = (string) dr["Name"];
            return img;
        }

        private int AddAnImage(Image image, int staticID)
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
                BridgeStaticImage(staticID ,imageID);
                return imageID;
            }
        }

        private void UpdateAnImage(Image image, int staticID)
        {
            using (
                SqlConnection cn =
                    new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "AddAnImage";
                cmd.Parameters.AddWithValue("@StaticPageID", staticID);
                cmd.Parameters.AddWithValue("@Name", image.Name);
                cmd.Parameters.AddWithValue("@ImageData", image.ImageData);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
        }

        public void DeleteStaticPageByID(int id)
        {
            using (
                SqlConnection cn =
                    new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "DeleteAStaticPage";
                cmd.Parameters.AddWithValue("@StaticPageID", id);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
        }

        private void BridgeStaticImage(int staticId, int imageId)
        {

            using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["CircularLogic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "BridgeStaticImage";
                cmd.Parameters.AddWithValue("@StaticPageID", staticId);
                cmd.Parameters.AddWithValue("@ImageID", imageId);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
        }
    }
}
