using FoodHub.DAO;
using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using System.Drawing;

using System.Xml.Linq;

namespace FoodHub.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
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
                this.BindRepeater();
                this.Gender();
                this.UserRole();
            }

        }

        private void BindRepeater()
        {
            string constr = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM users", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GetData.DataSource = dt;
                        GetData.DataBind();
                        //editUser.DataSource = dt;
                        //editUser.DataBind();



                    }
                }
            }
        }


        private void Gender()
        {
           
            string constr = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Gender", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet dt = new DataSet();
                        sda.Fill(dt);
                        txtGender.DataTextField = dt.Tables[0].Columns["Gender"].ToString();
                        txtGender.DataSource = dt;
                        txtGender.DataBind();

                    }
                }
            }
        }




        private void UserRole()
        {
            string constr = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM UserRole", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet dt = new DataSet();
                        sda.Fill(dt);
                        txtUserRole.DataTextField = dt.Tables[0].Columns["UserRole_Name"].ToString();
                        txtUserRole.DataSource = dt;
                        txtUserRole.DataBind();


                    }
                }
            }
        }

        protected void DeleteUser_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            UsersDao userdao = new UsersDao();

            userdao.Id = int.Parse((sender as LinkButton).CommandArgument);

            if (userdao.DeleteUser())
            {
                Response.Write("<script>alert('User deleted Successfully!!!.')</script>");
                this.BindRepeater();
            }
            
        }

        protected void EditUser_Click(object source, EventArgs e)
        {
            int User_id = int.Parse((source as LinkButton).CommandArgument);
            Response.Redirect("EditUser.aspx?User_id=" + User_id);

        }



        protected void OnRowDataBound(object sender, RepeaterCommandEventArgs e)
        {
        }

        
            

            protected void AddNewuser_click(object sender, EventArgs e)
             
        {
            UsersDao userdao = new UsersDao();
            userdao.UserName = txtUserName.Text;
            userdao.Email = txtEmail.Text;
            userdao.MobileNumber = txtMobileNumber.Text;
            userdao.Address = txtAddress.Text;
            userdao.Gender = txtGender.SelectedValue;
            userdao.UserRole = txtUserRole.SelectedValue;
            userdao.Password = txtPassword.Text;
            userdao.Photo = filePhoto.FileName;
            filePhoto.SaveAs(filename: Server.MapPath("assets/Images/UserProfile/" + filePhoto.FileName));


            if (userdao.Adduser())
            {
                Response.Write("<script>alert('User added successfully.')</script>");
                this.BindRepeater();
            }
        }

        //public void editUser_click(object sender, EventArgs e)
        //{

        //    RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
        //    UsersDao userdao = new UsersDao();
        //    userdao.Id = int.Parse((sender as LinkButton).CommandArgument);
        //    userdao.UserName = (item.FindControl("editUserName") as TextBox).Text;
        //    userdao.Email = (item.FindControl("editEmail") as TextBox).Text;
        //    userdao.MobileNumber = (item.FindControl("editMobileNumber") as TextBox).Text;
        //    userdao.Address = (item.FindControl("editAddress") as TextBox).Text;
        //    userdao.Gender = (item.FindControl("editGender") as DropDownList).SelectedValue;
        //    userdao.UserRole = (item.FindControl("editUserRole") as DropDownList).SelectedValue;
           
        //    //userdao.Photo = (item.FindControl("editeditfilePhoto") as File).SelectedValue;

        //    if (userdao.Updateuser())
        //    {
        //        Response.Write("<script>alert('User updated successfully.')</script>");
        //        this.BindRepeater();

        //    }
        //}


    }
}