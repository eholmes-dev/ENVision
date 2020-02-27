using DataAccessLayer;
using DataObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicLayer
{
    public class VolOppManager : IVolOppManager
    {
        private IVolOppAccessor _volOppAccessor;

        public VolOppManager()
        {
            _volOppAccessor = new VolOppAccessor();
        }

        public List<VolOppVM> GetAllVolOpps()
        {
            try
            {
                return _volOppAccessor.GetAllVolOpps();
            }
            catch (Exception ex)
            {

                throw new ApplicationException("NO DATA", ex);
            }
        }

        public VolOpp GetVolOppById(string VolOppId)
        {
            VolOpp result = null;
            try
            {
                
                result = _volOppAccessor.GetVolOppById(VolOppId);
               // string i = result.VolOppName.ToString()
            }
            catch (Exception ex)
            {

                throw new ApplicationException("didn't work..", ex);
            }
            return result;
        }

        public int SaveVolOppEdit(string editId, string updateName, string updateLocation, 
            DateTime updateDate, string updateOrganizer, string updateDescription)
        {
            int rows = 0;

            try
            {
                rows = _volOppAccessor.SaveVolOppEdit(editId, updateName, updateLocation, updateDate,updateOrganizer,updateDescription);
            }
            catch (Exception ex)
            {

                throw new ApplicationException("Update failed.",ex);
            }

            return rows;
        }

        public int CreateVolOpp(string createName, DateTime createDate, string createOrganizer, string createLocation, string createDescription)
        {
            int rows = 0;

            try
            {
                rows = _volOppAccessor.CreateVolOpp(createName, createDate, createOrganizer, createLocation, createDescription);
            }
            catch (Exception ex)
            {

                throw new ApplicationException("insert failed", ex);
            }

            return rows;
        }
    }
}
