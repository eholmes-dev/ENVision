using System;
using DataAccessLayer;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataObjects;
using System.Security.Cryptography;

namespace LogicLayer
{
    public class UserManager : IUserManager
    {
        private IUserAccessor _userAccessor;

        public UserManager()
        {
            _userAccessor = new UserAccessor();
        }

        public UserManager(IUserAccessor userAccessor)
        {
            _userAccessor = userAccessor;
        }
        public User AuthUser(string email, string password)
        {
            User result = null;

            // we need to hash the password
            var passwordHash = hashPassword(password);
            password = null;

            try
            {
                result = _userAccessor.AuthUser(email, passwordHash);
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Login failed!", ex);
            }

            return result;
        }

        private string hashPassword(string source)
        {
            // use SHA256
            string result = null;

            // we need a byte array because cryptography is bits and bytes
            byte[] data;

            // create a has provider object
            using (SHA256 sha256hash = SHA256.Create())
            {
                // hash the input
                data = sha256hash.ComputeHash(Encoding.UTF8.GetBytes(source));
            }
            // build a string from the result
            var s = new StringBuilder();

            // loop through the bytes to build a string
            for (int i = 0; i < data.Length; i++)
            {
                s.Append(data[i].ToString("x2"));
            }

            result = s.ToString().ToUpper();

            return result;
        }

        public bool UpdatePassword(int userId, string newPassword, string oldPassword)
        {
            bool isUpdated = false;
            string newPasswordHash = hashPassword(newPassword);
            string oldPasswordHash = hashPassword(oldPassword);

            try
            {
                isUpdated = _userAccessor.UpdatePasswordHash(userId,
                   oldPasswordHash, newPasswordHash);
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Update Failed", ex);
            }
            return isUpdated;
        }
    }
}
