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
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.Gender();
            }

        }

        protected void Registration_Click(object sender, EventArgs e)
        {
           
            try
            {
                //validate input
                if (txtPassword.Text.Length < 6)
                {
                    Response.Write("<script>alert('Password must be at least 6 characters long.')</script>");
                }
                else
                {
                    try
                    {
                        //create instane of middle layer business object
                        UsersDao user = new UsersDao();

                        //set email property, so it  can be used as a parameter for the query
                        user.Email = txtEmail.Text;

                        //check if the email exists
                        if (user.emailaddressExists())
                        {
                            //already exists so output error
                            Response.Write("<script>alert('EmailAddress already exists, please enter another one')</script>");
                        }
                        else
                        {
                            //INSERT NEW USER...   

                            //set properties, so it can be used as a parameter for the query
                            user.UserName = fullname.Text;
                            user.Password = txtPassword.Text;
                            user.MobileNumber = txtMobileNumber.Text;
                            user.Email = txtEmail.Text;
                            user.Gender = txtGender.SelectedValue;
                            user.Address = txtAddress.Text;
                            user.Photo = fileUserImage.FileName;
                            fileUserImage.SaveAs(filename: Server.MapPath("Admin/Images/UserProfile/" + fileUserImage.FileName));

                            user.UserRole = "User";

                            //attempt to add a User and test if it is successful
                            if (user.RegisterUser())
                            {
                                //redirect user to login page
                                Response.Redirect("Login.aspx");
                            }
                        }
                    }
                    catch
                    {
                        //exception thrown so display error
                        Response.Write("<script>alert('Database connection error - failed to insert record.')</script>");
                    }

                }
            }
            catch
            {
                //exception thrown so display error
                Response.Write("<script>alert('Database connection error - failed to insert record.')</script>");
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


    }

}