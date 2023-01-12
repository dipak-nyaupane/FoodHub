using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodHub.frontend
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.ViewProduct();
            }

        }

        private void ViewProduct()
        {
            string product = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(product))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM ProductDetails", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        cmd.CommandType = CommandType.Text;
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ProductData.DataSource = dt;
                        ProductData.DataBind();
                        //editUser.DataSource = dt;
                        //editUser.DataBind();



                    }
                }
            }
        }

       
 

        protected void ClickProductDetails(object source, EventArgs e)
        {
            int Product_id = int.Parse((source as LinkButton).CommandArgument);
            Response.Redirect("ViewProductDetails.aspx?Product_id=" + Product_id);

        }


    }
}