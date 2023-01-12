
using FoodHub.Utils;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FoodHub.DAO
{
    public class UsersDao
    {

        public int Id { get; set; }

        public string OldPassword { get; set; }


        public string UserName { get; set; }

        public string Password { get; set; }

        public string SessionEmail { get; set; }

        public string Email { get; set; }

        public string UserRole { get; set; }

        public string Address { get; set; }

        public string MobileNumber { get; set; }

        public string Gender { get; set; }

        public string Photo { get; set; }

        private DatabaseConnection dataConnection;

        public UsersDao()
        {
            dataConnection = new DatabaseConnection();
        }
        public bool emailaddressExists()
        {
            dataConnection.addParameter("@email_address", Email);
           
            string command = "Select COUNT(email) FROM users WHERE email=@email_address";

            int result = dataConnection.executeScalar(command); //result of count

            return result > 0 || result == -1; //if record found or exception caught
        }

        public bool SessionessionemailaddressExists()
        {
            dataConnection.addParameter("@email_address", Email);
            dataConnection.addParameter("@SessionEmail", SessionEmail);
            string command = "Select COUNT(email) FROM users WHERE email=@email_address and email!=@SessionEmail";
            int result = dataConnection.executeScalar(command); //result of count

            return result > 0 || result == -1; //if record found or exception caught
        }

    
        public bool Adduser()
        {

            dataConnection.addParameter("@UserNAme", UserName);
            dataConnection.addParameter("@Password", Password);
            dataConnection.addParameter("@Email", Email);
            dataConnection.addParameter("@UserRole", UserRole);
            dataConnection.addParameter("@Address", Address);
            dataConnection.addParameter("@MobileNumber", MobileNumber);
            dataConnection.addParameter("@Gender", Gender);
            dataConnection.addParameter("@Photo", Photo);
            dataConnection.addParameter("@RegistrationDate", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));
            string command = "INSERT INTO users(username,password,email,user_role,address,mobile_number,gender,photo,registration_date)VALUES(@UserName,@Password,@Email,@UserRole,@Address,@MobileNumber,@Gender,@photo,@RegistrationDate)";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected
        }



        public bool RegisterUser() 
        { 
            dataConnection.addParameter("@UserNAme", UserName);
            dataConnection.addParameter("@Password", Password);
            dataConnection.addParameter("@Email", Email);
            dataConnection.addParameter("@UserRole",UserRole);
            dataConnection.addParameter("@Address", Address);
            dataConnection.addParameter("@MobileNumber", MobileNumber);
            dataConnection.addParameter("@Gender", Gender);
            dataConnection.addParameter("@Photo", Photo);
            dataConnection.addParameter("@RegistrationDate", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));
            string command = "INSERT INTO users(username,password,email,user_role,address,mobile_number,gender,photo,registration_date)VALUES(@UserName,@Password,@Email,@UserRole,@Address,@MobileNumber,@Gender,@photo,@RegistrationDate)";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected
        }



        public bool Updateuser()
        {


            dataConnection.addParameter("@UserNAme", UserName);
            dataConnection.addParameter("@Uid", Id);
            dataConnection.addParameter("@Email", Email);
            dataConnection.addParameter("@UserRole", UserRole);
            dataConnection.addParameter("@Address", Address);
            dataConnection.addParameter("@MobileNumber", MobileNumber);
            dataConnection.addParameter("@Gender", Gender);
            dataConnection.addParameter("@Photo", Photo);
            string command = "UPDATE users SET username=@UserNAme, email=@Email, user_role=@UserRole,address=@Address,mobile_number=@MobileNumber,gender=@Gender,photo=@Photo  WHERE id=@Uid";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected
        }

        public bool Changepassword()
        {

            dataConnection.addParameter("@Uid", Id);
            dataConnection.addParameter("@OldPassword", OldPassword);
            dataConnection.addParameter("@NewPassword", Password);
      
            string command = "UPDATE users SET password=@NewPassword Where password=@OldPassword And id=@Uid";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected
        }


        public bool Updatenormaluser()
        {


            dataConnection.addParameter("@UserNAme", UserName);
            dataConnection.addParameter("@Uid", Id);
            dataConnection.addParameter("@Email", Email);
            dataConnection.addParameter("@Address", Address);
            dataConnection.addParameter("@MobileNumber", MobileNumber);
            dataConnection.addParameter("@Gender", Gender);
            dataConnection.addParameter("@Photo", Photo);
            string command = "UPDATE users SET username=@UserNAme, email=@Email, address=@Address,mobile_number=@MobileNumber,gender=@Gender,photo=@Photo  WHERE id=@Uid";
            return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected
        }

        public bool DeleteUser()
        {
            dataConnection.addParameter("@Uid", Id);

            string command = "DELETE FROM users where id = @Uid";

            return dataConnection.executeNonQuery(command) > 0;
        }

    


            public bool authenticateUser()
        {
            dataConnection.addParameter("@email", Email);
            dataConnection.addParameter("@password", Password);
        

            string command = "SELECT id, email, username,photo,gender,mobile_number,address,user_role FROM users WHERE email=@email AND password=@password";

            DataTable table = dataConnection.executeReader(command);

            if (table.Rows.Count > 0)
            {
                HttpContext.Current.Session["UserID"] = table.Rows[0]["id"].ToString();
                HttpContext.Current.Session["UserName"] = table.Rows[0]["username"].ToString();
                HttpContext.Current.Session["Email"] = table.Rows[0]["email"].ToString();
                HttpContext.Current.Session["Photo"] = table.Rows[0]["photo"].ToString();
                HttpContext.Current.Session["gender"] = table.Rows[0]["gender"].ToString();
                HttpContext.Current.Session["Mobile_number"] = table.Rows[0]["Mobile_number"].ToString();
                HttpContext.Current.Session["user_role"] = table.Rows[0]["user_role"].ToString();

                HttpContext.Current.Session["address"] = table.Rows[0]["address"].ToString();
                return true;
            }
            else
            {
                return false;
            }
        }


     public bool emailValidation()
        {
            dataConnection.addParameter("@email_address", Email);

            string command = "Select COUNT(email) FROM users WHERE email=@email_address";

            int result = dataConnection.executeScalar(command); //result of count

            return result > 0 || result == -1;
        }






        //private DbConnection dc = new DbConnection();

        //public void CrateUser(User u)
        //{
        //    string sql = "INSERT INTO users(username,password,email,user_role,address,mobile_number,gender,photo,registration_date)VALUES(@UserName,@Password,@Email,@UserRole,@Address,@MobileNumber,@Gender,@photo,@RegistrationDate)";
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = dc.cn;
        //    cmd.CommandText = sql;
        //    cmd.Parameters.AddWithValue("@UserNAme", u.UserName);
        //    cmd.Parameters.AddWithValue("@Password", u.Password);
        //    cmd.Parameters.AddWithValue("@Email", u.Email);
        //    cmd.Parameters.AddWithValue("@UserRole", u.UserRole);
        //    cmd.Parameters.AddWithValue("@Address", u.Address);
        //    cmd.Parameters.AddWithValue("@MobileNumber", u.MobileNumber);
        //    cmd.Parameters.AddWithValue("@Gender", u.Gender);
        //    cmd.Parameters.AddWithValue("@Photo", u.Photo);
        //    cmd.Parameters.AddWithValue("@RegistrationDate", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));
        //    cmd.ExecuteNonQuery();
        //}


    }
}