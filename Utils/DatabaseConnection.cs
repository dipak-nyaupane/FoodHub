using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FoodHub.Utils
{
    public class DatabaseConnection
    {

        private DbConnection con;
        private DbCommand com;
        private List<DbParameter> parameters;


        public DatabaseConnection()
        {
            string strcon = ConfigurationManager.ConnectionStrings["DipakConn"].ConnectionString;
            //string strcon = System.Configuration.ConfigurationManager.AppSettings.Get("MyConnection").ToString();
            con = new SqlConnection(strcon);
            com = new SqlCommand();
            com.Connection = con;
            parameters = new List<DbParameter>();
        }

        public void addParameter(string name, object value)
        {
            parameters.Add(new SqlParameter(name, value));
        }

        public int executeNonQuery(string command)
        {
            setupSqlCommand(command);

            try
            {
                con.Open();
                return com.ExecuteNonQuery();
            }
            catch
            {
                return -1; //failure
            }
            finally
            {
                con.Close();
            }
        }

        public int executeScalar(string command)
        {
            setupSqlCommand(command);

            try
            {
                con.Open();

                return (int)com.ExecuteScalar();
            }
            catch
            {
                return -1; //failure
            }
            finally
            {
                con.Close();
            }
        }

        public DataTable executeReader(string command)
        {
            setupSqlCommand(command);

            DataTable table = new DataTable();

            try
            {
                con.Open();
                table.Load(com.ExecuteReader()); //automatically closes the data reader
                return table;
            }
            catch
            {
                return null; //failure
            }
            finally
            {
                con.Close();
            }
        }

        public DataTable fillDataTable(string command)
        {
            setupSqlCommand(command);

            DataTable table = new DataTable();

            DbDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = com;

            try
            {
                adapter.Fill(table); // Fill will open and close connection (so long as it hasn't been opened before calling it)

                return table;
            }
            catch
            {
                return null; //failure
            }
        }

        private void setupSqlCommand(string command)
        {
            com.CommandText = command;
            //comm.CommandType = CommandType.StoredProcedure; //UNCOMMENT IF USING STORED PROCEDURES

            com.Parameters.Clear(); //clear params from any previously executed command

            foreach (DbParameter dbP in parameters)
            {
                com.Parameters.Add(dbP);
            }

            parameters.Clear(); //clear list of params ready for next command
        }
    }
}