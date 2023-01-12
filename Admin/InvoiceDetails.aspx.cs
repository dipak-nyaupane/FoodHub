using FoodHub.DAO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHub.Admin
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 0)
            {
                Response.Redirect("~/./Frontend/Dashboard.aspx");
            }
            else
            {

                OrderDao user = new OrderDao();
                //retrieve nesseccary session data, casting into variables
                string ID = (string)Session["UserID"];
                string fullname = (string)Session["username"];
                string Email = (string)Session["Email"];
                string userRole = (string)Session["user_role"];

            }


            if (!this.IsPostBack)
            {
                int Invoice_Number = int.Parse(Request.QueryString["Invoice_Number"]);
                ProductDao product = new ProductDao();
                this.CategoryProducts();
                //product.Id = Int32.Parse(Product_id);
                //string ProductCategoryId = product.GetProductCategoryId();





                string productCon = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
                string sql;
                SqlCommand comm;

                SqlConnection conn = new SqlConnection(productCon);
                conn.Open();
                sql = "SELECT OrderDetails.Customer_id, SUM(Quantity*Total_Price) as totalSum, COUNT(Order_id) as total_items FROM OrderDetails WHERE OrderDetails.Status=3 AND OrderDetails.Invoice_Number='" + Invoice_Number + "' GROUP BY OrderDetails.Customer_id;";

                comm = new SqlCommand(sql, conn);

                SqlDataAdapter da = new SqlDataAdapter(comm);
                DataSet ds = new DataSet();
                da.Fill(ds);
               
                TotalPrice.Text = ds.Tables[0].Rows[0]["totalSum"].ToString();
                conn.Close();

            }


        }

        private void CategoryProducts()
        {
            string Invoice_Number = Request.QueryString["Invoice_Number"];
            string product = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(product))
            {
                string productCon = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
                string sql;

                SqlCommand comm;
                SqlConnection conn = new SqlConnection(productCon);
                conn.Open();

                sql = "SELECT a.Order_id, a.Invoice_Number, d.username, a.Customer_id,a.Product_id,a.Quantity, a.Category_id,b.Product_id,b.product_name,b.product_price,b.product_description,b.Product_image,c.CategoryName,(a.Quantity*b.product_price) as totalCost FROM OrderDetails a, ProductDetails b, CategoryDetails c, Users d WHERE a.product_id=b.Product_id AND a.Customer_id=d.id AND a.Category_id=c.Category_id AND  a.Status=3 AND a.Invoice_Number='" + Invoice_Number + "' ";


                comm = new SqlCommand(sql, conn);
                SqlDataAdapter da = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                da.Fill(dt);
                ProductData.DataSource = dt;
                ProductData.DataBind();

            }
        }





    }
}