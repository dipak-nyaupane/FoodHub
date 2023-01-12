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

namespace FoodHub.Admin
{
    public partial class WebForm13 : System.Web.UI.Page
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
                    using (SqlCommand cmd = new SqlCommand("SELECT Distinct (a.username),b.product_name,b.Product_id, c.Feedback,c.Ratings FROM Feedback c, Users  a,ProductDetails b where a.id=c.User_id and c.Product_id=b.Product_id ", con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GetData.DataSource = dt;
                            GetData.DataBind();
                            //editCategory.DataSource = dt;
                            //editCategory.DataBind();

                        }
                    }
                }

          

        }

        protected void rept_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString.ToString());

            if (e.CommandName == "delete")
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("delete from Feedback where Product_id = @sid", con);
                cmd.Parameters.AddWithValue("@sid", e.CommandArgument);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                this.BindRepeater();
            }
        }


    }
}