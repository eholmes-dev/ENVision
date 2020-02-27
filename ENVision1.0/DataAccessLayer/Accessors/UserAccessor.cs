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
    public class UserAccessor : IUserAccessor
    {
        public User AuthUser(string username, string passwordHash)
        {   
            //set 1 if authenticated
            User result = null; 

            // first, get a connection
            var conn = DBConnection.GetConnection();

            // next, we need a command object
            var cmd = new SqlCommand("sp_authenticate_user");
            cmd.Connection = conn;

            // set the command type
            cmd.CommandType = CommandType.StoredProcedure;

            // add parameters for the procedure
            cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 250);
            cmd.Parameters.Add("@PasswordHash", SqlDbType.NVarChar, 100);

            // set the values for the parameters
            cmd.Parameters["@Email"].Value = username;
            cmd.Parameters["@PasswordHash"].Value = passwordHash;

            // now that the command is set up, we can execute it
            try
            {
                // open the connection
                conn.Open();

                // execute the command
                if (1 == Convert.ToInt32(cmd.ExecuteScalar()))
                {
                    // if the command worked correctly, get a user
                    // object
                    result = getUserByEmail(username);
                }
                else
                {
                    throw new ApplicationException("User not found.");
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
            return result;
        }

        private User getUserByEmail(string email)
        {
            User user = null;

            // connection
            var conn = DBConnection.GetConnection();

            // command objects (2)
            var cmd1 = new SqlCommand("sp_select_user_by_email");
          

            cmd1.Connection = conn;
      

            cmd1.CommandType = CommandType.StoredProcedure;
     

            // parameters
            cmd1.Parameters.Add("@Email", SqlDbType.NVarChar, 250);
            cmd1.Parameters["@Email"].Value = email;

            

            try
            {
                // open connection
                conn.Open();

                // execute the first command
                var reader1 = cmd1.ExecuteReader();

                if (reader1.Read())
                {
                    user = new User();

                    user.UserId = reader1.GetInt32(0);
                    user.FirstName = reader1.GetString(1);
                    user.LastName = reader1.GetString(2);
                    user.PhoneNumber = reader1.GetString(3);
                    user.Email = email;
                }
                else
                {
                    throw new ApplicationException("User not found.");
                }
                reader1.Close(); // this is no longer needed

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return user;
        }

        public bool UpdatePasswordHash(int userId, string oldPasswordHash, string newPasswordHash)
        {
            bool updateSuccess = false;

            // connection
            var conn = DBConnection.GetConnection();

            // cmd
            var cmd = new SqlCommand("sp_update_password");
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;

            // parameters
            cmd.Parameters.Add("@UserId", SqlDbType.Int);
            cmd.Parameters.Add("@OldPasswordHash", SqlDbType.NVarChar, 100);
            cmd.Parameters.Add("@NewPasswordHash", SqlDbType.NVarChar, 100);

            // values
            cmd.Parameters["@UserId"].Value = userId;
            cmd.Parameters["@OldPasswordHash"].Value = oldPasswordHash;
            cmd.Parameters["@NewPasswordHash"].Value = newPasswordHash;

            // execute the command
            try
            {
                conn.Open();
                int rows = cmd.ExecuteNonQuery();

                updateSuccess = (rows == 1);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }

            return updateSuccess;
        }

        //public User AuthUser(string email, object passwordHash)
        //{
        //    throw new NotImplementedException();
        //}
    }
}
