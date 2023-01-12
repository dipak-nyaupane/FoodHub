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
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

         

            if (Session.Count == 0)
            {
                Response.Redirect("~/./login.aspx");
            }

            if (!this.IsPostBack)
            {
                this.ViewProduct();
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
                       



                    }
                }
            }
        }



        protected void ClickProductDetails(object source, EventArgs e)
        {
            int Product_id = int.Parse((source as LinkButton).CommandArgument);
            Response.Redirect("ProductDetails.aspx?Product_id=" + Product_id);

        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            OrderDao cartdetails = new OrderDao();
            int productId = int.Parse((sender as LinkButton).CommandArgument);
            int userId = Convert.ToInt32(Session["UserID"]);
          
            int qty = 1;

            cartdetails.Total_Price = int.Parse((item.FindControl("price") as Label).Text);
            cartdetails.CategoryId = int.Parse((item.FindControl("CategoryId") as Label).Text);

            int Status = 0;
            cartdetails.Status = Status;

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
                this.ViewProduct();
            }
            else

            {
                if (cartdetails.AddToCart(userId, productId, qty))
                {
                    Response.Write("<script>alert('Product added into cart.')</script>");
                    this.ViewProduct();
                }
            }
        }


        }
    }