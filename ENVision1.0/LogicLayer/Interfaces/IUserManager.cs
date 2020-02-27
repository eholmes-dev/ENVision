using System;
using DataObjects;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicLayer
{
    public interface IUserManager
    {
        User AuthUser(string email, string password);

        bool UpdatePassword(int userId, string newPassword, string oldPassword);



    }
}
