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
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.TotalProduct();
              
            }
        }

        private void TotalProduct()
        {
           
            string product = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(product))
            {
                string productCon = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
                string sql;

                SqlCommand comm;


                SqlConnection conn = new SqlConnection(productCon);
                conn.Open();
                sql = "SELECT a.Customer_id, a.Invoice_Number, b.Status_Name,a.Status, SUM(a.Quantity*a.Total_Price) as totalSum, COUNT(a.Order_id) as total_items FROM OrderDetails a,Status b WHERE a.Status=b.Status_Id AND  Status=3 AND a.Invoice_Number=a.Invoice_Number GROUP BY a.Customer_id ,a.Invoice_Number,b.Status_Name,a.Status";
                comm = new SqlCommand(sql, conn);
                SqlDataAdapter da = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                da.Fill(dt);
                viewStatus.DataSource = dt;
                viewStatus.DataBind();
               
               

            }
        }



        protected void ViewInvoice_Click(object sender, EventArgs e)
        {
            int Invoice_Number = int.Parse((sender as LinkButton).CommandArgument);
           
            Response.Redirect("InvoiceDetails.aspx?Invoice_Number=" + Invoice_Number);
        }



    }
}