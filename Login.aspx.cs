using FoodHub.DAO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHub
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //this.UserRole();

            }

        }
      
        protected void Btn_signup(object sender, EventArgs e)
        {
      
                Response.Redirect("signup.aspx");
            
        }




        protected void Btn_Login_Click(object sender, EventArgs e)
        {
            try
            {
                UsersDao user = new UsersDao();


                user.Email = txtEmail.Text;
                user.Password = txtpassword.Text;
                
                
                if (user.authenticateUser())
                {
                    string userRole = (string)Session["user_role"];
                    if (userRole == "Admin")
                    {
                        Response.Redirect("~/Admin/dashboard.aspx");
                    }else if (userRole == "User")
                    {
                        Response.Redirect("~/Frontend/Users/Dashboard.aspx");
                    }
                    else
                    {
                        Response.Write("Try Again");
                    }
                    
                }
                else
                {
                    Response.Write("<script>alert('Please enter valid Username, Password And User Role')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('Database error: can't login now.')</script>");
            }
        }
    }
}