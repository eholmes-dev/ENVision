using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObjects
{
    public class VolOpp
    {
        public int VolOppId { get; set; }
        public string VolOppName { get; set; }
        public DateTime OppDate { get; set; }
        public string Organizer { get; set; }
        public string Location { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
    }
}
