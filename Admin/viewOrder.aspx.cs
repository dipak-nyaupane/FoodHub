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
    public partial class WebForm8 : System.Web.UI.Page
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
                using (SqlCommand cmd = new SqlCommand("SELECT c.username, a.Customer_id, a.Invoice_Number, b.Status_Name,a.Status, SUM(a.Quantity*a.Total_Price) as totalSum, COUNT(a.Order_id) as total_items FROM OrderDetails a,Status b,Users c WHERE a.Status=b.Status_Id AND a.Status=3 AND a.Invoice_Number=a.Invoice_Number and a.Customer_id=c.id GROUP BY a.Customer_id,a.Invoice_Number,b.Status_Name,a.Status,c.username", con))
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

        protected void ViewInvoice_Click(object sender, EventArgs e)
        {
            int Invoice_Number = int.Parse((sender as LinkButton).CommandArgument);

            Response.Redirect("InvoiceDetails.aspx?Invoice_Number=" + Invoice_Number);
        }


    }
}