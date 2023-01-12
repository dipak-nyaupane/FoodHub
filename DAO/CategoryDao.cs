using FoodHub.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodHub.DAO
{
    public class CategoryDao
    {
        public int Id { get; set; }

        public string CategoryName { get; set; }

        public string CategoryDescription { get; set; }

        private DatabaseConnection dataConnection;


        public CategoryDao()
        {
            dataConnection = new DatabaseConnection();
        }

        public bool AddCategory()
        {

            dataConnection.addParameter("@CategoryName", CategoryName);
            dataConnection.addParameter("@CategoryDescription", CategoryDescription);
            dataConnection.addParameter("@CreatedDate", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));
            string command = "INSERT INTO CategoryDetails(CategoryName,CategoryDescription,created_date)VALUES(@CategoryName,@CategoryDescription,@CreatedDate)";
            return dataConnection.executeNonQuery(command) > 0;
        }

        public bool UpdateCategory()
        {
            dataConnection.addParameter("@Uid", Id);
            dataConnection.addParameter("@CategoryName", CategoryName);
            dataConnection.addParameter("@CategoryDescription", CategoryDescription);
            string command = "UPDATE CategoryDetails SET CategoryName=@CategoryName, CategoryDescription=@CategoryDescription WHERE Category_id=@Uid";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected
        }


    }
}