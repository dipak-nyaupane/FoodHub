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

namespace FoodHub.Frontend.Users
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.CategoryProducts();
                this.TotalProduct();
               // this.Gender();
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

                sql = "SELECT a.Order_id, a.Invoice_Number, a.Customer_id,a.Product_id,a.Quantity, a.Category_id,b.Product_id,b.product_name,b.product_price,b.product_description,b.Product_image,c.CategoryName,(a.Quantity*b.product_price) as totalCost FROM OrderDetails a, ProductDetails b, CategoryDetails c WHERE a.product_id=b.Product_id AND a.Category_id=c.Category_id AND a.Status=3 AND a.Invoice_Number='"+ Invoice_Number +"' ";

               
                comm = new SqlCommand(sql, conn);
                SqlDataAdapter da = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                da.Fill(dt);
                ProductData.DataSource = dt;
                ProductData.DataBind();

            }
        }


        private void TotalProduct()
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
                sql = "SELECT OrderDetails.Customer_id, SUM(Quantity*Total_Price) as totalSum, COUNT(Order_id) as total_items FROM OrderDetails WHERE OrderDetails.Status=3 AND OrderDetails.Invoice_Number='" + Invoice_Number + "' GROUP BY OrderDetails.Customer_id;";
                comm = new SqlCommand(sql, conn);
                SqlDataAdapter da = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                da.Fill(dt);
                ProductTotalData.DataSource = dt;
                ProductTotalData.DataBind();

            }
        }
        protected void UpdateQty_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            OrderDao cartdetails = new OrderDao();
            int userId = Convert.ToInt32(Session["UserID"]);
            cartdetails.Ratings = int.Parse((item.FindControl("drpReatings") as DropDownList).SelectedValue);
            cartdetails.Feedback= (item.FindControl("txtFeedback") as TextBox).Text;
            cartdetails.Id = int.Parse((sender as LinkButton).CommandArgument);

            if (cartdetails.RateProduct(userId))
            {
           
                Response.Redirect("InvoiceDetails.aspx");

            }


        }


    }
}