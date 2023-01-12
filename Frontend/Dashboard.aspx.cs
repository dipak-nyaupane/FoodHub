using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHub.frontend
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Request.QueryString["cat"] != null)
                {
                    int catId = Convert.ToInt32(Request.QueryString["cat"]);
                    CategoryProducts(catId);

                }
                else
                {
                    this.ViewProduct();
                    // this.productCategory();
                }
                this.Category();

            }

        }

        private void Category()
        {
            string product = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(product))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM CategoryDetails", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        cmd.CommandType = CommandType.Text;
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptCAtegory.DataSource = dt;
                        rptCAtegory.DataBind();
                        //editUser.DataSource = dt;
                        //editUser.DataBind();



                    }
                }
            }
        }

        private void CategoryProducts(int catId)
        {
            string product = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(product))
            {
                string productCon = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
                string sql;
                SqlCommand comm;

                SqlConnection conn = new SqlConnection(productCon);
                conn.Open();
                sql = "SELECT * FROM ProductDetails WHERE product_category_id='" + catId + " ' ";
                comm = new SqlCommand(sql, conn);

                SqlDataAdapter da = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                da.Fill(dt);
                ProductData.DataSource = dt;
                ProductData.DataBind();
                //editUser.DataSource = dt;
                //editUser.DataBind();

            }
        }


        private void ViewProduct()
        {
            string product = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(product))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM ProductDetails", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        cmd.CommandType = CommandType.Text;
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ProductData.DataSource = dt;
                        ProductData.DataBind();
                        //editUser.DataSource = dt;
                        //editUser.DataBind();



                    }
                }
            }
        }


        protected void ClickProductDetails(object source, EventArgs e)
        {
            int Product_id = int.Parse((source as LinkButton).CommandArgument);
            Response.Redirect("ViewProductDetails.aspx?Product_id=" + Product_id);

        }

    }
}