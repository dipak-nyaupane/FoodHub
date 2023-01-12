using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHub.Frontend
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string Product_id = Request.QueryString["Product_id"];
                string productCon = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
                string sql;
                SqlCommand comm;

                SqlConnection conn = new SqlConnection(productCon);
                conn.Open();
                sql = "SELECT ProductDetails.Product_id,ProductDetails.product_name,ProductDetails.product_image,ProductDetails.product_description,ProductDetails.product_price,ProductDetails.Product_category_id,CategoryDetails.CategoryName,CategoryDetails.Category_id FROM ProductDetails,CategoryDetails WHERE ProductDetails.Product_id='" + Product_id + " ' AND ProductDetails.Product_category_id=CategoryDetails.Category_id ";
                comm = new SqlCommand(sql, conn);

                SqlDataAdapter da = new SqlDataAdapter(comm);
                DataSet ds = new DataSet();
                da.Fill(ds);
                editProductId.Text = ds.Tables[0].Rows[0]["Product_id"].ToString();
                Product_Name.Text = ds.Tables[0].Rows[0]["product_name"].ToString();
                Product_description.Text = ds.Tables[0].Rows[0]["product_description"].ToString();
                Product_price.Text = ds.Tables[0].Rows[0]["product_price"].ToString();
                Product_category_id.Text = ds.Tables[0].Rows[0]["CategoryName"].ToString();
                string image = ds.Tables[0].Rows[0]["product_image"].ToString();
                Image.ImageUrl = "~/./Admin/assets/Images/ProductPhoto/" + image;

            }

         
        }

        protected void AddCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Login.aspx");
        }

    }
}