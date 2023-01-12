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
    public partial class WebForm2 : System.Web.UI.Page
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
                String ID = (string)Session["UserID"];
                string Fullname = (string)Session["username"];

                string Email = (string)Session["Email"];

                string userRole = (string)Session["user_role"];

                //lbl_fullname.Text = Fullname;

            }

            if (!this.IsPostBack)
            {
                String ID = (string)Session["UserID"];
                string Fullname = (string)Session["username"];
                string Gender = (string)Session["gender"];
                string Email = (string)Session["Email"];
                string userRole = (string)Session["user_role"];
                string Address = (string)Session["Address"];
                string Mobile_Number = (string)Session["mobile_number"];
                string Photo = (string)Session["photo"];

                txtUserName.Text = Fullname;
                txtUserId.Text = ID;
                txtEmail.Text = Email;
                txtGender.Text = Gender;
               
                txtMobileNumber.Text = Mobile_Number;
                txtAddress.Text = Address;

                Image.ImageUrl = "~/./Admin/assets/Images/UserProfile/" + Photo;



            }
        }

        protected void btn_User_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditUser.aspx");
        }


    }

}
    
