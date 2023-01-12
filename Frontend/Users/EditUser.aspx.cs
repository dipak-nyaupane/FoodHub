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
                String ID = (string)Session["UserID"];
                string Fullname = (string)Session["username"];

                string Email = (string)Session["Email"];

                string userRole = (string)Session["user_role"];

                lbl_fullname.Text = Fullname;

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

                //String name = Fullname;
                editUserName.Text = Fullname;
                editUserId.Text = ID;
                editEmail.Text = Email;
                editGender.SelectedValue = Gender;
                //editUserRole.SelectedValue = userRole;
                editMobileNumber.Text = Mobile_Number;
                editAddress.Text = Address;
                lblEditfilePhoto.Text = Photo;
                this.Gender();
                //this.UserRole();

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

        public void editUser_click(object sender, EventArgs e)
        {


            string SessionEmail = (string)Session["Email"];
            UsersDao user = new UsersDao();
            user.SessionEmail = SessionEmail;
            user.Email = editEmail.Text;

            if (user.SessionessionemailaddressExists())
            {

                //already exists so output error
                Response.Write("<script>alert('EmailAddress already exists, please enter another one')</script>");

            }



            else
            {
                String User_id = (string)Session["UserID"];
                UsersDao userdao = new UsersDao();
                userdao.Id = Int32.Parse(User_id);

                userdao.UserName = editUserName.Text;
                userdao.Email = editEmail.Text;
                userdao.MobileNumber = editMobileNumber.Text;
                userdao.Address = editAddress.Text;
                userdao.Gender = editGender.SelectedValue;
                //userdao.UserRole = editUserRole.SelectedValue;

                String oldimage = lblEditfilePhoto.Text;

                if (editfilePhoto.FileName.Length == 0)
                {
                    userdao.Photo = oldimage;

                }
                else
                {
                    userdao.Photo = editfilePhoto.FileName;
                    editfilePhoto.SaveAs(filename: Server.MapPath("~/./Admin/assets/Images/UserProfile/" + editfilePhoto.FileName));
                }


                if (userdao.Updatenormaluser())
                {

                    //Session.Abandon();


                    Response.Redirect("dashboard.aspx");
                    Session.Clear();
                    Session.RemoveAll();

                }

            }


        }

   



      


    
}
}