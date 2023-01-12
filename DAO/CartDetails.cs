using FoodHub.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodHub.DAO
{
    public class CartDetails
    {
        private DatabaseConnection dataConnection;
        public int Id { get; set; }

        public int Qty { get; set; }

        public int price { get; set; }

        

        public CartDetails()
        {
            dataConnection = new DatabaseConnection();
        }
        public bool AddToCart(int userId, int productId, int qty)
        {
            dataConnection.addParameter("@userId", userId);
            dataConnection.addParameter("@price", price);
            dataConnection.addParameter("@productId", productId);
            dataConnection.addParameter("@qty", qty);
            string command = "INSERT INTO CartDetails(product_id,user_id,qty,price)VALUES(@productId,@userId,@qty,@price)";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected

        }

        public bool ListCart()
        {
            int userId = Convert.ToInt32(HttpContext.Current.Session["UserID"]);
            
            string command = "SELECT * FROM CartDetails WHERE userId=@userId";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected

        }

        public bool UpdateCart()
        {
            dataConnection.addParameter("@Uid", Id);
            dataConnection.addParameter("@Qty", Qty);

            string command = "UPDATE CartDetails SET qty=@Qty WHERE id=@Uid";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected

        }

        public bool DeleteCart()
        {
            dataConnection.addParameter("@Uid", Id);

            string command = "DELETE FROM CartDetails WHERE id=@Uid";

            return dataConnection.executeNonQuery(command) > 0;
     

        }

        public bool validateCart(int userId, int productId)
        {
            dataConnection.addParameter("@user_id", userId);
            dataConnection.addParameter("@productId", productId);
            string command = "Select COUNT(product_id) FROM CartDetails WHERE product_id=@productId and user_id=@user_id";
            //return dataConnection.executeNonQuery(command) > 0;
            int result = dataConnection.executeScalar(command);
            return result > 0 || result == -1;
        }


        }
}