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
    public partial class WebForm3 : System.Web.UI.Page
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
                string Fullname = (string)Session["username"];
                string Email = (string)Session["Email"];
                string userRole = (string)Session["user_role"];

            }

            if (!this.IsPostBack)
            {
                this.ViewProduct();
                this.productCategory();
            }
        }
        private void ViewProduct()
        {
            string product = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(product))
            {
               // using (SqlCommand cmd = new SqlCommand("SELECT * FROM ProductDetails", con))

                using (SqlCommand cmd = new SqlCommand("SELECT ProductDetails.Product_id, ProductDetails.Product_name,ProductDetails.Product_price,ProductDetails.product_unit,ProductDetails.product_category_id,ProductDetails.product_description,ProductDetails.product_image,CategoryDetails.Category_id,CategoryDetails.CategoryName FROM ProductDetails,CategoryDetails  WHERE CategoryDetails.Category_id=ProductDetails.product_category_id", con))
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
                        txtProductCategory.DataValueField = dt.Tables[0].Columns["Category_id"].ToString();
                        txtProductCategory.DataTextField = dt.Tables[0].Columns["CategoryName"].ToString();
                        txtProductCategory.DataSource = dt;
                        txtProductCategory.DataBind();

                    }
                }
            }
        }


        //protected void rept_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString.ToString());

        //    if (e.CommandName == "delete")
        //    {
        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }
        //        SqlCommand cmd = new SqlCommand("delete from ProductDetails where Product_id = @sid", con);
        //        cmd.Parameters.AddWithValue("@sid", e.CommandArgument);
        //        cmd.ExecuteNonQuery();
        //        cmd.Dispose();
        //        this.productCategory();
        //    }
        //}


        protected void DeleteProduct_Click(object sender, EventArgs e)
        {
             ProductDao product = new ProductDao();
            product.Id = int.Parse((sender as LinkButton).CommandArgument);

            if (product.DeleteProduct())
            {
                Response.Write("<script>alert('Product deleted Successfully!!!.')</script>");
                this.ViewProduct();
            }
       
        }




        protected void EditProduct_Click(object source, EventArgs e)
        {
            int Product_id = int.Parse((source as LinkButton).CommandArgument);
            Response.Redirect("EditProduct.aspx?ProductId=" + Product_id);

        }

        protected void AddProduct_click(object sender, EventArgs e)
        {
            ProductDao productdao = new ProductDao();
            productdao.ProductName = txtProductName.Text;
            productdao.ProductDescription = txtProductDescription.Text;
            productdao.ProductImage = productPhoto.FileName;
            productdao.ProductPrice = txtProductPrice.Text;
            productdao.ProductUnit = txtProductUnit.Text;
            productdao.ProductCategory = txtProductCategory.SelectedItem.Value;

            productPhoto.SaveAs(filename: Server.MapPath("assets/Images/ProductPhoto/" + productPhoto.FileName));


            if (productdao.AddProduct())
            {
                Response.Write("<script>alert('Product added successfully.')</script>");
                this.ViewProduct();
            }
        }



        //protected void editProduct_click(object sender, EventArgs e)
        //{
        //    RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
        //    ProductDao productdao = new ProductDao();
        //    productdao.Id = int.Parse((sender as LinkButton).CommandArgument);
        //    productdao.ProductName = (item.FindControl("editProductName") as TextBox).Text;
        //    productdao.ProductDescription = (item.FindControl("editProductDescription") as TextBox).Text;
        //    productdao.ProductImage = productPhoto.FileName;
        //    productdao.ProductPrice = (item.FindControl("editProductPrice") as TextBox).Text;
        //    productdao.ProductUnit = (item.FindControl("editProductUnit") as TextBox).Text;
        //    productdao.ProductCategory = (item.FindControl("editProductCategory") as DropDownList).SelectedValue;
        //    //productPhoto.SaveAs(filename: Server.MapPath("ProductPhoto/" + productPhoto.FileName));

        //    if (productdao.UpdateProduct())
        //    {
        //        Response.Write("<script>alert('Product updated successfully.')</script>");
        //        this.ViewProduct();
        //    }

       // }
    }
}