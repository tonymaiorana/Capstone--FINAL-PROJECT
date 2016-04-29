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

        private int AddAStaticPage(StaticPage newStaticPage)
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
                return staticID;
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

            staticPage.StaticID = (int)dr["StaticPageID"];
            staticPage.Title = (string)dr["Title"];
            staticPage.HtmlContent = (string)dr["TextBody"];
            staticPage.UpdateTime = (DateTime)dr["UpdateTime"];
            staticPage.CreationTime = (DateTime)dr["CreationTime"];
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
                cmd.CommandText = "GetStaticImageByBStaticID";
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
            img.ImageID = (int)dr["ImageID"];
            img.ImageData = (string)dr["ImageData"];
            img.Name = (string)dr["Name"];
            return img;
        }
    }
}
