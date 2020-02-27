using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataObjects;

namespace DataAccessLayer
{
    public interface IUserAccessor
    {
        User AuthUser(string username, string passwordH);

        bool UpdatePasswordHash(int userId, string oldPasswordHash,
            string newPasswordHash);
        //User AuthUser(string email, object passwordHash);
    }
}
