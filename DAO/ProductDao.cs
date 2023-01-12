using FoodHub.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace FoodHub.DAO
{
    public class ProductDao
    {
        public int Id { get; set; }

        public string ProductName { get; set; }

        public string ProductDescription { get; set; }

        public string ProductPrice { get; set; }

        public string ProductCategory { get; set; }

        public string ProductUnit { get; set; }

        public string ProductImage { get; set; }

        public string ProductImage1 { get; set; }

        private DatabaseConnection dataConnection;

        public ProductDao()
        {
            dataConnection = new DatabaseConnection();
        }

        public bool AddProduct()
        {
            dataConnection.addParameter("@ProductName", ProductName);
            dataConnection.addParameter("@ProductDescription", ProductDescription);
            dataConnection.addParameter("@ProductImage", ProductImage);
            dataConnection.addParameter("@ProductPrice", ProductPrice);
            dataConnection.addParameter("@ProductCategory", ProductCategory);
            dataConnection.addParameter("@ProductUnit", ProductUnit);
            dataConnection.addParameter("@created_date", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));
            string command = "INSERT INTO ProductDetails(product_name,product_description,product_image,Product_price,product_category_id,product_unit,created_date)VALUES(@ProductName,@ProductDescription,@ProductImage,@ProductPrice,@ProductCategory,@ProductUnit,@created_date)";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected

        }

        public bool UpdateProduct()
        {
            dataConnection.addParameter("@Uid", Id);
            dataConnection.addParameter("@ProductName", ProductName);
            dataConnection.addParameter("@ProductDescription", ProductDescription);
            dataConnection.addParameter("@ProductImage", ProductImage);

            dataConnection.addParameter("@ProductPrice", ProductPrice);
            dataConnection.addParameter("@ProductCategory", ProductCategory);
            dataConnection.addParameter("@ProductUnit", ProductUnit);
            string command = "UPDATE ProductDetails SET product_name=@ProductName, product_description=@ProductDescription, product_image=@ProductImage,Product_price=@ProductPrice,product_category_id=@ProductCategory,product_unit=@ProductUnit  WHERE Product_id=@Uid";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected

        }

        public bool DeleteProduct()
        {
            dataConnection.addParameter("@Uid", Id);

            string command = "DELETE FROM ProductDetails WHERE Product_id=@Uid";

            return dataConnection.executeNonQuery(command) > 0;
        }

   
    }
}