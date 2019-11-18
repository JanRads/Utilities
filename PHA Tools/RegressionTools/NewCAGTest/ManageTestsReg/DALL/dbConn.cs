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
        public async Task<ArgsConn> Read(string query)
        {
            string mes = null;
            DataTable dataTable = new DataTable();           
            
            SqlDataReader rdr = null;
            try
            {
                await Open();
                if (conn != null)
                {   
                 
                    SqlCommand cmd = new SqlCommand(null, conn);
                    cmd.CommandTimeout = 1800;

                    string[] queries = query.Split(new[] { "go ", "Go ", "GO ", "gO " }, StringSplitOptions.RemoveEmptyEntries);
                    int maxSTR = (queries == null ? 0 : queries.Count());
                    for (int i = 0; i <= maxSTR-2; i++)
                    {
                        cmd.CommandText = queries[i];
                        await cmd.ExecuteNonQueryAsync();
                    }

                    cmd.CommandText = queries[maxSTR-1];
                    var dr = await cmd.ExecuteReaderAsync();

                    dataTable.Load(dr);
                    Close();
                }
            }
            catch(Exception e)
            {
                mes = e.Message;
            }
            finally
            {
                if (rdr != null)
                {
                    rdr.Close();
                }
            }

            return new ArgsConn(dataTable, mes);
        }
        public async Task Open()
        {
            try
            {
                conn = new SqlConnection(CS);
                await conn.OpenAsync();
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
    public class ArgsConn
    {
        public DataTable test;
        public string message;
        public ArgsConn(DataTable Test,string Message)
        {
            test = Test;
            message = Message;
        }
    }
}
