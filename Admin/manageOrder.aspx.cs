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
using System.Net.NetworkInformation;

namespace FoodHub.Admin
{
    public partial class WebForm9 : System.Web.UI.Page
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
                //using (SqlCommand cmd = new SqlCommand("SELECT * FROM OrderDetails ", con))
                using (SqlCommand cmd = new SqlCommand("SELECT c.username, a.Customer_id, a.Invoice_Number, b.Status_Name,a.Status, SUM(a.Quantity*a.Total_Price) as totalSum, COUNT(a.Order_id) as total_items FROM OrderDetails a,Status b,Users c WHERE a.Status=b.Status_Id  AND a.Invoice_Number=a.Invoice_Number and a.Customer_id=c.id GROUP BY a.Customer_id,a.Invoice_Number,b.Status_Name,a.Status,c.username Order by a.Status asc", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GetData.DataSource = dt;
                        GetData.DataBind();
                   

                    }
                }
            }


        }

   

        protected void rept_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
           
        }

        protected void UpdateStatus_Click(object sender, EventArgs e)
        {
            OrderDao order= new OrderDao();
            order.Id = int.Parse((sender as LinkButton).CommandArgument);
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            order.Status = int.Parse((item.FindControl("editStatus") as DropDownList).SelectedItem.Value);
            if (order.UpdateStatus())
            {
                //Response.Write("<script>alert('Product Status Change Successfully!!!.')</script>");
                this.BindRepeater();
            }
        }


    }
  }