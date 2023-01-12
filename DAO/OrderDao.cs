using FoodHub.Utils;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FoodHub.DAO
{
    public class OrderDao
    {

        public int Id { get; set; }
        public int  Status { get; set; }
        public int Quantity { get; internal set; }

        public int Total_Price { get; set; }

        public int CategoryId { get; set; }

        public int Invoice_Number { get; set; }
        public int Ratings { get; set; }
        public string Feedback { get; set; }

        private DatabaseConnection dataConnection;


        public OrderDao()
        {
            dataConnection = new DatabaseConnection();
        }


        public bool UpdateStatus()
        {
            dataConnection.addParameter("@Status", Status);
            dataConnection.addParameter("@Uid", Id);

            string command = "Update OrderDetails SET Status=@Status WHERE Invoice_Number = @Uid";

            return dataConnection.executeNonQuery(command) > 0;
        }


        public string LoadInvoice(int userId)
        {
         
            dataConnection.addParameter("@Uid", userId);
            string command = "SELECT DISTINCT(Invoice_Number) From OrderDetails WHERE Customer_id = @Uid AND Status=0";
            DataTable tbl = dataConnection.executeReader(command);
            if (tbl.Rows.Count > 0)
            {
                return tbl.Rows[0]["Invoice_Number"].ToString();
            } else
            {
                return "";
            }

        }

        public bool ObtainInvoice(int userId)
        {
            dataConnection.addParameter("@Uid", userId);
            string command = "SELECT COUNT(Invoice_Number) From OrderDetails WHERE Customer_id = @Uid AND Status=0;";
            int result = dataConnection.executeScalar(command);
            return result > 0 || result == -1;
        }


        public bool AddToCart(int userId, int productId, int qty)
        {
            dataConnection.addParameter("@userId", userId);
            dataConnection.addParameter("@Total_price", Total_Price);
            dataConnection.addParameter("@productId", productId);
            dataConnection.addParameter("@CategoryId", CategoryId);
            dataConnection.addParameter("@Invoice_Number", Invoice_Number);
            dataConnection.addParameter("@qty", qty);
            dataConnection.addParameter("@Status", Status);
            dataConnection.addParameter("@Order_Date", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));

            string command = "INSERT INTO OrderDetails(product_id,Category_id,Quantity,Total_Price,Invoice_Number,Status,Order_Date,Customer_id)VALUES(@productId,@CategoryId,@qty,@Total_price,@Invoice_Number,@Status,@Order_Date,@userId)";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected

        }


        public bool RateProduct(int userId)
        {
            dataConnection.addParameter("@userId", userId);
            dataConnection.addParameter("@productId", Id);

            dataConnection.addParameter("@Ratings", Ratings);

            dataConnection.addParameter("@Feedback", Feedback);

            dataConnection.addParameter("@Feedback_Date", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));

            string command = "INSERT INTO Feedback (User_id,Product_id,Ratings,Feedback,Feedback_date)VALUES(@userId,@productId,@Ratings,@Feedback,@Feedback_Date)";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected

        }
        public bool UpdateCart()
        {
            dataConnection.addParameter("@Uid", Id);
            dataConnection.addParameter("@Qty", Quantity);

            string command = "UPDATE OrderDetails SET Quantity=@Qty WHERE Product_id=@Uid";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected

        }


        public bool DeleteCart()
        {
            dataConnection.addParameter("@Uid", Id);

            string command = "DELETE FROM OrderDetails WHERE Product_id=@Uid";

            return dataConnection.executeNonQuery(command) > 0;


        }



        public bool validateCart(int userId, int productId)
        {
            dataConnection.addParameter("@user_id", userId);
            dataConnection.addParameter("@productId", productId);
            string command = "Select COUNT(Product_id) FROM OrderDetails WHERE Product_id=@productId and Customer_id=@user_id and Status=0";
            //return dataConnection.executeNonQuery(command) > 0;
            int result = dataConnection.executeScalar(command);
            return result > 0 || result == -1;
        }

        public bool UpdateCheckOut(int UserId)
        {
            dataConnection.addParameter("@Uid", UserId);
            dataConnection.addParameter("@Status", Status);
            dataConnection.addParameter("@Invoice_Number", Invoice_Number);

            string command = "UPDATE OrderDetails SET Status=@Status WHERE Customer_id=@Uid and @Invoice_Number=Invoice_Number";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected

        }

        public bool UpdateDelivery(int UserId)
        {
            dataConnection.addParameter("@Uid", UserId);
            dataConnection.addParameter("@Status", Status);
            dataConnection.addParameter("@Invoice_Number", Invoice_Number);

            string command = "UPDATE OrderDetails SET Status=@Status WHERE Customer_id=@Uid and @Invoice_Number=Invoice_Number";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected

        }


    }
}