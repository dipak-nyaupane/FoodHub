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
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 0)
            {
                Response.Redirect("~/./login.aspx");
            }
            if (!this.IsPostBack)
            {
                string Product_id = Request.QueryString["Product_id"];
                string productCon = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
                string sql;
                SqlCommand comm;

                SqlConnection conn = new SqlConnection(productCon);
                conn.Open();
                sql = "SELECT ProductDetails.Product_id,ProductDetails.product_name,ProductDetails.product_image,ProductDetails.product_description,ProductDetails.product_price,ProductDetails.Product_category_id,CategoryDetails.CategoryName,CategoryDetails.Category_id FROM ProductDetails,CategoryDetails WHERE ProductDetails.Product_id='" + Product_id + " ' AND ProductDetails.Product_category_id=CategoryDetails.Category_id";
                comm = new SqlCommand(sql, conn);

                SqlDataAdapter da = new SqlDataAdapter(comm);
                DataSet ds = new DataSet();
                da.Fill(ds);
                editProductId.Text = ds.Tables[0].Rows[0]["Product_id"].ToString();
                Product_Name.Text = ds.Tables[0].Rows[0]["product_name"].ToString();
                Product_description.Text= ds.Tables[0].Rows[0]["product_description"].ToString();
                Product_price.Text = ds.Tables[0].Rows[0]["product_price"].ToString();
                Product_category_id.Text = ds.Tables[0].Rows[0]["CategoryName"].ToString();
                
                //new added 
                Product_category_id1.Text = ds.Tables[0].Rows[0]["Product_category_id"].ToString();

                string image= ds.Tables[0].Rows[0]["product_image"].ToString();
                Image.ImageUrl = "~/./Admin/assets/Images/ProductPhoto/" + image;

              


            }



        }



        protected void AddToCart_Click(object sender, EventArgs e)
        {
          
            OrderDao cartdetails = new OrderDao();
           
            int productId = Convert.ToInt32( Request.QueryString["Product_id"]);
            int userId = Convert.ToInt32(Session["UserID"]);

            int Status = 0;

            cartdetails.Status = Status;

            cartdetails.CategoryId = int.Parse((Product_category_id1.Text));

            cartdetails.Total_Price = int.Parse((Product_price.Text));
            
            int qty = 1;

            if (cartdetails.ObtainInvoice(userId))
            {

                int invoice = Int32.Parse(cartdetails.LoadInvoice(userId));
                if (invoice > 0)
                {
                    cartdetails.Invoice_Number = invoice;
                }
            }
            else
            {
                Random Invoice = new Random();
                int Invoice_Number = Invoice.Next(100000, 999999);
                cartdetails.Invoice_Number = Invoice_Number;

            }


            if (cartdetails.validateCart(userId, productId))
            {
                Response.Write("<script>alert('!!- Product is already in a Cart!.')</script>");
                
            }
            else
            {
                if (cartdetails.AddToCart(userId, productId, qty))
                {
                    Response.Write("<script>alert('Product added into cart.')</script>");
             
                }
            }

        }
    }

    
}