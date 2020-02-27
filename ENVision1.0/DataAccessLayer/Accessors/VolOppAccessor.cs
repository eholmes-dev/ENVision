using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataObjects;

namespace DataAccessLayer
{
    public class VolOppAccessor : IVolOppAccessor
    {
        public List<VolOppVM> GetAllVolOpps() {
            List<VolOppVM> volOpps = new List<VolOppVM>();

            var conn = DBConnection.GetConnection();
            var cmd = new SqlCommand("sp_select_all_vol_opps", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                conn.Open();
                var reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        volOpps.Add(new VolOppVM()
                        {   
                            volOppId = reader.GetInt32(0),
                            volOppName = reader.GetString(1),
                            oppDate = reader.GetDateTime(2).ToString(),
                            oppLocation = reader.GetString(3),
                            organizer = reader.GetString(4),
                            description = reader.GetString(5)
                        });
                    }
                    reader.Close();
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                conn.Close();
            }


            return volOpps;
        }

        public VolOpp GetVolOppById(string VolOppId)
        {

            VolOpp _volOpp = null;

            int vOppId = int.Parse(VolOppId);

            var conn = DBConnection.GetConnection();
            var cmd = new SqlCommand("sp_select_vol_opp_by_id", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@volOppId", vOppId);

            try
            {
                conn.Open();
                var reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    _volOpp = new VolOpp();

                    _volOpp.VolOppId = reader.GetInt32(0);
                    _volOpp.VolOppName = reader.GetString(1);
                    _volOpp.OppDate = reader.GetDateTime(2);
                    _volOpp.Organizer = reader.GetString(3);
                    _volOpp.Location = reader.GetString(4);
                    _volOpp.Description = reader.GetString(5);
                    _volOpp.Active = reader.GetBoolean(6);
                    //_volOpp.Active = reader.GetBoolean(6);
                  }
                else
                {
                    throw new ApplicationException("Volunteer Opp Not Found");
                }
                    
                    reader.Close();
                }
            catch (Exception ex)
            {

                throw ex;
            }
            //finally
            //{
            //    conn.Close();
            //}


            return _volOpp;
        }

        public int SaveVolOppEdit(string editId, string updateName, string updateLocation,
            DateTime updateDate, string updateOrganizer, string updateDescription)
        {
            int rows = 0;

            var conn = DBConnection.GetConnection();
            var cmd = new SqlCommand("sp_update_vol_opp_by_id", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@VolOppId", editId);
            cmd.Parameters.AddWithValue("@VolOppName", updateName);
            cmd.Parameters.AddWithValue("@OppLocation", updateLocation);
            cmd.Parameters.AddWithValue("@OppDate", updateDate);
            cmd.Parameters.AddWithValue("@Organizer", updateOrganizer);
            cmd.Parameters.AddWithValue("@Description", updateDescription);


            try
            {
                //VolOpp editThisOpp =  GetVolOppById(editId);
                conn.Open();
                rows = cmd.ExecuteNonQuery();
                


            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                conn.Close();
            }
            return rows;

        }

        public int CreateVolOpp(string createName, DateTime createDate, string createOrganizer, string createLocation, string createDescription)
        {
            int rows = 0;

            var conn = DBConnection.GetConnection();
            var cmd = new SqlCommand("sp_insert_vol_opp", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("@VolOppId", editId);
            cmd.Parameters.AddWithValue("@VolOppName", createName);
            cmd.Parameters.AddWithValue("@OppLocation", createLocation);
            cmd.Parameters.AddWithValue("@OppDate", createDate);
            cmd.Parameters.AddWithValue("@Organizer", createOrganizer);
            cmd.Parameters.AddWithValue("@Description", createDescription);

            try
            {
                conn.Open();
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw ex;
            }


            return rows;
        }

    }
}
