using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodHub.DAO;

namespace FoodHub.Admin
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 0)
            {
                Response.Redirect("~/./login.aspx");
            }
            else
            {

                UsersDao user = new UsersDao();
                //retrieve nesseccary session data, casting into variables
                string ID = (string)Session["UserID"];
                string fullname = (string)Session["username"];
                string Email = (string)Session["Email"];
                string userRole = (string)Session["user_role"];

            }


            if (!this.IsPostBack)
            {
                string ProductId = Request.QueryString["ProductId"];
                ProductDao product = new ProductDao();
                product.Id=Int32.Parse(ProductId);
                //string ProductCategoryId = product.GetProductCategoryId();





                string productCon= ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
                string sql;
                SqlCommand comm;

                SqlConnection conn = new SqlConnection(productCon);
                conn.Open();
                sql = "SELECT ProductDetails.Product_id, ProductDetails.Product_name,ProductDetails.Product_price,ProductDetails.product_unit,ProductDetails.product_category_id,ProductDetails.product_description,ProductDetails.product_image,CategoryDetails.Category_id,CategoryDetails.CategoryName FROM ProductDetails,CategoryDetails  WHERE CategoryDetails.Category_id=ProductDetails.product_category_id AND ProductDetails.Product_id='" + ProductId +" '";
   
                comm = new SqlCommand(sql, conn);

                SqlDataAdapter da=new SqlDataAdapter(comm);
                DataSet ds=new DataSet();
                da.Fill(ds);
                editProductId.Text = ds.Tables[0].Rows[0]["Product_id"].ToString();
                editProductName.Text = ds.Tables[0].Rows[0]["product_name"].ToString();
                
                //to get product name from product id 
                editProductCategory.SelectedValue = ds.Tables[0].Rows[0]["Category_id"].ToString();


                editProductPrice.Text = ds.Tables[0].Rows[0]["product_price"].ToString();
                editProductUnit.Text= ds.Tables[0].Rows[0]["product_unit"].ToString();
                editProductDescription.Text = ds.Tables[0].Rows[0]["product_description"].ToString();
                lblEditPhoto.Text= ds.Tables[0].Rows[0]["product_image"].ToString();
                this.productCategory();
                conn.Close();

            }
        }

        private void productCategory()
        {
            string constr = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM CategoryDetails", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet dt = new DataSet();
                        sda.Fill(dt);
                        editProductCategory.DataSource = dt;
                        editProductCategory.DataValueField = dt.Tables[0].Columns["Category_id"].ToString();
                        editProductCategory.DataTextField = dt.Tables[0].Columns["CategoryName"].ToString();
                        //editProductCategory.DataValueField = dt.Tables[0].Columns["Category_id"].ToString();
                        editProductCategory.DataBind();

                    }
                }
            }
        }




        public void editProduct_click(object sender, EventArgs e)
        {
            string ProductId = Request.QueryString["ProductId"];
            ProductDao productdao = new ProductDao();

            string Product_id = Request.QueryString["ProductId"];
            productdao.Id = Int32.Parse(ProductId);


            productdao.ProductName = editProductName.Text;
            productdao.ProductDescription = editProductDescription.Text;
            //productdao.ProductImage = productPhoto.FileName;
            productdao.ProductPrice = editProductPrice.Text;
            productdao.ProductUnit = editProductUnit.Text;

            productdao.ProductCategory = editProductCategory.SelectedItem.Value;

            String oldimage = lblEditPhoto.Text;
         


            if (productPhoto.FileName.Length == 0)
            {
               productdao.ProductImage = oldimage;

            } else
            {
                productdao.ProductImage = productPhoto.FileName;
                productPhoto.SaveAs(filename: Server.MapPath("assets/Images//ProductPhoto/" + productPhoto.FileName));
            }


            //productPhoto.SaveAs(filename: Server.MapPath("ProductPhoto/" + productPhoto.FileName));


            if (productdao.UpdateProduct())
            {
                //Response.Write("<script>alert('User added successfully.')</script>");
                Response.Redirect("manageProduct.aspx");
            }

        }




    }
}