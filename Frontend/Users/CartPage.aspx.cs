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
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                this.CategoryProducts();
                this.TotalProduct();
            }
        }
        private void CategoryProducts()
        {
            string product = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(product))
            {
                string productCon = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
                string sql;
            
                SqlCommand comm;
         

                SqlConnection conn = new SqlConnection(productCon);
                conn.Open();

                sql = "SELECT a.Order_id, a.Customer_id,a.Product_id,a.Quantity, a.Category_id,b.Product_id,b.product_name,b.product_price,b.product_description,b.Product_image,c.CategoryName,(a.Quantity*b.product_price) as totalCost FROM OrderDetails a, ProductDetails b, CategoryDetails c WHERE a.product_id=b.Product_id AND a.Category_id=c.Category_id AND a.Status=0";
                
                //sql = "SELECT CartDetails.user_id,CartDetails.id,CartDetails.product_id,CartDetails.qty,ProductDetails.Product_id,ProductDetails.product_name,ProductDetails.product_price,ProductDetails.product_description,ProductDetails.Product_image, " +
                  //  "(CartDetails.qty*ProductDetails.product_price) as totalCost FROM CartDetails,ProductDetails WHERE CartDetails.product_id= ProductDetails.Product_id";             
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
            string product = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(product))
            {
                string productCon = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
                string sql;
             
                SqlCommand comm;
              

                SqlConnection conn = new SqlConnection(productCon);
                conn.Open();
                sql = "SELECT OrderDetails.Customer_id, SUM(Quantity*Total_Price) as totalSum, COUNT(Order_id) as total_items FROM OrderDetails WHERE OrderDetails.Status=0 GROUP BY OrderDetails.Customer_id;";


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
            cartdetails.Quantity = int.Parse((item.FindControl("intQty") as TextBox).Text);
            cartdetails.Id = int.Parse((sender as LinkButton).CommandArgument);

            if (cartdetails.UpdateCart())
            {
                Response.Redirect("cartpage.aspx");
                ProductData.DataBind();
            }
        

        }

        protected void DeleteCat_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            OrderDao cartdetails = new OrderDao();
            cartdetails.Id = int.Parse((sender as LinkButton).CommandArgument);
            if (cartdetails.DeleteCart())
            {
                Response.Redirect("cartpage.aspx");
                ProductData.DataBind();
            }
        
        }

        protected void ContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx");
        }

        protected void GotoCheckout_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            OrderDao cartdetails = new OrderDao();
            int userId = Convert.ToInt32(Session["UserID"]);
            int Status = 1;

            cartdetails.Status = Status;
            
            if (cartdetails.ObtainInvoice(userId))
            {

                int invoice = Int32.Parse(cartdetails.LoadInvoice(userId));
                if (invoice > 0)
                {
                    cartdetails.Invoice_Number = invoice;
                }
            }

            if (cartdetails.UpdateCheckOut(userId))
            {
                Response.Write("<script>alert('Payment Success please check Status page for order details!.')</script>");
                ProductData.DataBind();
                ProductTotalData.DataBind();
            }







        }


        


    }
}