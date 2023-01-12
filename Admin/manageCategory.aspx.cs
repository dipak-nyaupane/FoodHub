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
    public partial class WebForm7 : System.Web.UI.Page
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
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM CategoryDetails", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GetData.DataSource = dt;
                        GetData.DataBind();
                        editCategory.DataSource = dt;
                        editCategory.DataBind();



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
                SqlCommand cmd = new SqlCommand("delete from CategoryDetails where Category_id = @sid", con);
                cmd.Parameters.AddWithValue("@sid", e.CommandArgument);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                this.BindRepeater();
            }
        }

        protected void AddCategory_click(object sender, EventArgs e)
        {
            CategoryDao categorydao = new CategoryDao();

            categorydao.CategoryName = txtCategoryName.Text;
            categorydao.CategoryDescription = txtCategoryDes.Text;


            if (categorydao.AddCategory())
            {
                Response.Write("<script>alert('Category added successfully.')</script>");
                this.BindRepeater();
            }

        }

        public void editCategory_click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            CategoryDao categorydao = new CategoryDao();
            categorydao.Id = int.Parse((sender as LinkButton).CommandArgument);
            categorydao.CategoryName = (item.FindControl("editCategoryName") as TextBox).Text;
            categorydao.CategoryDescription = (item.FindControl("editCategoryDescription") as TextBox).Text;

            if (categorydao.UpdateCategory())
            {
                Response.Write("<script>alert('Category updated successfully.')</script>");
                this.BindRepeater();
            }

        }
    }
}