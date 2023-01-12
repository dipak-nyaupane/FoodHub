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
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!this.IsPostBack)
            {
                
                this.TotalProduct();
            }

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
                string image = (string)Session["photo"];
                //Image.ImageUrl = "~/./Admin/assets/Images/UserProfile/" + image;
                lbl_fullname.Text = Fullname;
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
                CartTotal.DataSource = dt;
                CartTotal.DataBind();

            }
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();

            Response.Redirect("../../Frontend/Dashboard.aspx");

        }

        protected void btn_User_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }


        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            String User_id = (string)Session["UserID"];
            UsersDao userdao = new UsersDao();
            userdao.Id = Int32.Parse(User_id);
            userdao.OldPassword = txtOldPassword.Text;
            userdao.Password = newPassword.Text;

            if (userdao.Changepassword())
            {
                Response.Write("<script>alert('Password Update Successfully.')</script>");
            }
            else
            {
                Response.Write("<script>alert('Old password Does not Mach-->!.')</script>");
            }

        }


    }
}