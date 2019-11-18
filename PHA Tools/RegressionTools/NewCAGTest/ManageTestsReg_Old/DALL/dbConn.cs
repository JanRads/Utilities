using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DALL
{
    public class dbConn
    {
        private SqlConnection conn=null;
        string CS;
        public dbConn(string Server, string DB)
        {
            CS= string.Format("Data Source={0};Initial Catalog={1};Integrated Security=SSPI", Server, DB);
        }
        public  DataTable Read( string query)
        {
            DataTable dataTable = new DataTable();           
            
            SqlDataReader rdr = null;
            try
            {               
                if (conn != null)
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);


                    da.Fill(dataTable);
                }
            }
            finally
            {

                if (rdr != null)
                {
                    rdr.Close();
                }

            }

            return dataTable;
        }
        public void Open()
        {
            try
            {
                conn = new SqlConnection(CS);
                conn.Open();
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public void Close()
        {
            if (conn != null)
                conn.Close();
        }

        public  void write(string Server, string DB, string query)
        {
            try
            {
                if (conn != null)
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }    
    }
}
