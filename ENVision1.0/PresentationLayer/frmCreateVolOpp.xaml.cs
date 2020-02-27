using LogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace PresentationLayer
{
    /// <summary>
    /// Interaction logic for frmCreateVolOpp.xaml
    /// </summary>
    public partial class frmCreateVolOpp : Window
    {

        private IVolOppManager _volOppManager;
        private IUserManager _userManager;

        public frmCreateVolOpp()
        {
            InitializeComponent();
            _volOppManager = new VolOppManager();
            _userManager = new UserManager();
        }

        private void btnCreateVolOpp_Click(object sender, RoutedEventArgs e)
        {   
            


            string createId = editOppId.Text.ToString();

            string createName = txtCreateVolOppName.Text.ToString();
            string createLocation = txtCreateVolOppLocation.Text.ToString();
            DateTime createDate = DateTime.Parse(txtCreateVolOppDate.Text.ToString());
            string createOrganizer = txtCreateVolOppOrganizer.Text.ToString();
            string createDescription = txtCreateVolOppDescription.Text.ToString();

            int submit =
                _volOppManager.CreateVolOpp
                (createName, createDate, createOrganizer, createLocation, createDescription);


            this.Close();
        }
    }
}
