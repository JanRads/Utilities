using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataLoding
{
    public class Query
    {
        public Query(string domain, string queryText, string desc, string phase)
        {
            Domain = domain;
            Query_Text = queryText;
            Desc = desc;
            Phase = phase;
        }
        public string Domain { get; set; }
        public string Query_Text { get; set; }
        public string Desc { get; set; }
        public string Phase { get; set; }

    }
}
