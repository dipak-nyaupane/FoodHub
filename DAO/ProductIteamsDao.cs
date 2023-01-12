using FoodHub.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodHub.DAO
{
    public class ProductIteamsDao
    {
        private DatabaseConnection dataConnection;

      public  int TotalAmount { get; set; }

      public  int Status { get; set; }

        public int TotalItems { get; set; }

        public ProductIteamsDao()
        {
            dataConnection = new DatabaseConnection();
        }

        public bool AddPayment(int userId)
        {
            dataConnection.addParameter("@userId", userId);
            dataConnection.addParameter("@TotalAmmount", TotalAmount);
            dataConnection.addParameter("@TotalItems", TotalItems);
            dataConnection.addParameter("@Status", Status);
            
            string command = "INSERT INTO OrderitemDetails(user_id,total_amount,total_items,status)VALUES(@userId,@TotalAmmount,@TotalItems,@Status)";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected

        }

    }
}