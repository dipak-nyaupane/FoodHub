using FoodHub.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHub.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
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
                string image = (string)Session["photo"];
                Image.ImageUrl = "assets/Images/UserProfile/" + image;
                lbl_fullname.Text = Fullname;

                Image1.ImageUrl   = "assets/Images/UserProfile/" + image;
                lbl_fullname1.Text = Fullname;

            }
        }

            protected void btn_logout_Click(object sender, EventArgs e)
            {
                Session.Clear();
                Session.RemoveAll();
                Session.Abandon();

                Response.Redirect("../Frontend/Dashboard.aspx");

            }

        protected void btn_User_Click(object sender,EventArgs e)
        {
            //string ID = (string)Session["UserID"];

            Response.Redirect("EditUserProfile.aspx");
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