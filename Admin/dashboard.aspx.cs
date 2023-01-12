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

namespace FoodHub.Admin
{
    public partial class WebForm12 : System.Web.UI.Page
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
            }
        }
        private void BindRepeater()
        {
            string constr = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(id) as TotalUser from Users ", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        DataDetails.DataSource = dt;
                        DataDetails.DataBind();

                    }
                }

                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(Product_id) as TotalUser from ProductDetails", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        DataDetails1.DataSource = dt;
                        DataDetails1.DataBind();
                    }
                }

                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(Category_id) as TotalUser from CategoryDetails", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        DataDetails2.DataSource = dt;
                        DataDetails2.DataBind();
                    }
                }

                using (SqlCommand cmd = new SqlCommand("Select Count(Distinct(Invoice_Number)) as TotalUser  from OrderDetails Where Status!=0", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        DataDetails3.DataSource = dt;
                        DataDetails3.DataBind();
                    }
                }

                using (SqlCommand cmd = new SqlCommand("Select Count(Distinct(Invoice_Number)) as TotalUser  from OrderDetails where Status=3;", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        DataDetails4.DataSource = dt;
                        DataDetails4.DataBind();
                    }
                }

                using (SqlCommand cmd = new SqlCommand("Select Count(Distinct(Invoice_Number)) as TotalUser  from OrderDetails where Status=1;", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        DataDetails5.DataSource = dt;
                        DataDetails5.DataBind();
                    }
                }

                using (SqlCommand cmd = new SqlCommand("Select Count(Distinct(Invoice_Number)) as TotalUser  from OrderDetails where Status=2;", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        DataDetails6.DataSource = dt;
                        DataDetails6.DataBind();
                    }
                }

            }
        }


    }
}
