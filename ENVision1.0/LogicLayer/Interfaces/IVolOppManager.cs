using DataObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicLayer
{
    public interface IVolOppManager
    {
        List<VolOppVM> GetAllVolOpps();

        VolOpp GetVolOppById(string VolOppId);

        int SaveVolOppEdit(string editId, string updateName, string updateLocation,
            DateTime updateDate, string updateOrganizer, string updateDescription);

        int CreateVolOpp(string createName, DateTime createDate, string createOrganizer, string createLocation, string createDescription);

    }
}
