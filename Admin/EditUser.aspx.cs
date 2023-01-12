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
    public partial class WebForm11 : System.Web.UI.Page
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
                string User_id = Request.QueryString["User_id"];
                string productCon = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
                string sql;
                SqlCommand comm;

                SqlConnection conn = new SqlConnection(productCon);
                conn.Open();
                sql = "SELECT * FROM users WHERE id='" + User_id + " ' ";
                comm = new SqlCommand(sql, conn);

                SqlDataAdapter da = new SqlDataAdapter(comm);
                DataSet ds = new DataSet();
                da.Fill(ds);
                editUserId.Text = ds.Tables[0].Rows[0]["id"].ToString();
                editUserName.Text = ds.Tables[0].Rows[0]["username"].ToString();
                editEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                editGender.SelectedValue = ds.Tables[0].Rows[0]["gender"].ToString();
                editUserRole.SelectedValue = ds.Tables[0].Rows[0]["user_role"].ToString();
                editMobileNumber.Text = ds.Tables[0].Rows[0]["mobile_number"].ToString();
                editAddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
                lblEditfilePhoto.Text = ds.Tables[0].Rows[0]["photo"].ToString();
                this.Gender();
                this.UserRole(); 

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
                        editGender.DataTextField = dt.Tables[0].Columns["Gender"].ToString();
                        editGender.DataSource = dt;
                        editGender.DataBind();

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
                        editUserRole.DataTextField = dt.Tables[0].Columns["UserRole_Name"].ToString();
                        editUserRole.DataSource = dt;
                        editUserRole.DataBind();


                    }
                }
            }

        }

        public void editUser_click(object sender, EventArgs e)
        {
           

                    string User_id = Request.QueryString["User_id"];
                    UsersDao userdao = new UsersDao();
                    userdao.Id = Int32.Parse(User_id);
                    userdao.UserName = editUserName.Text;
                    userdao.Email = editEmail.Text;
                    userdao.MobileNumber = editMobileNumber.Text;
                    userdao.Address = editAddress.Text;
                    userdao.Gender = editGender.SelectedValue;
                    userdao.UserRole = editUserRole.SelectedValue;
                   
                    String oldimage = lblEditfilePhoto.Text;

                    if (editfilePhoto.FileName.Length == 0)
                    {
                        userdao.Photo = oldimage;

                    }
                    else
                    {
                        userdao.Photo = editfilePhoto.FileName;
                        editfilePhoto.SaveAs(filename: Server.MapPath("assets/Images/UserProfile/" + editfilePhoto.FileName));
                    }


                    if (userdao.Updateuser())
                    {
                        Response.Redirect("User.aspx");

                    }

                }



    



        }
}
