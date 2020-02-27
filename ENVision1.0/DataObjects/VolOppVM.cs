using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObjects
{
    public class VolOppVM 
    {   
        public int volOppId { get; set; }
        public string volOppName { get; set; }
        public string oppDate { get; set; }
        public string oppLocation { get; set; }
        public string organizer { get; set; }
        public string description { get; set; }
    }
}
