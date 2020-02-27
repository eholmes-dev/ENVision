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
    /// Interaction logic for frmEditVolOpp.xaml
    /// </summary>
    public partial class frmEditVolOpp : Window
    {
        private IVolOppManager _volOppManager;
        private IUserManager _userManager;

        public frmEditVolOpp()
        {
            InitializeComponent();
            _volOppManager = new VolOppManager();
            _userManager = new UserManager();
        }

        private void btn_VolOpp_Edit_Click(object sender, RoutedEventArgs e)
        {
            txtEditVolOppName.IsReadOnly = false;
            txtEditVolOppLocation.IsReadOnly = false;
            txtEditVolOppOrganizer.IsReadOnly = false;
            txtEditVolOppDescription.IsReadOnly = false;

            txtEditVolOppName.Background = System.Windows.Media.Brushes.White;
            txtEditVolOppLocation.Background = System.Windows.Media.Brushes.White;
            txtEditVolOppOrganizer.Background = System.Windows.Media.Brushes.White;
            txtEditVolOppDescription.Background = System.Windows.Media.Brushes.White;

            btn_VolOpp_Save.Visibility = Visibility.Visible;
        }

        private void btn_VolOpp_Save_Click(object sender, RoutedEventArgs e)
        {
            string editId = editOppId.Text.ToString();

            string updateName = txtEditVolOppName.Text.ToString();
            string updateLocation = txtEditVolOppLocation.Text.ToString();
            DateTime updateDate = DateTime.Parse(txtEditVolOppDate.Text.ToString());
            string updateOrganizer = txtEditVolOppOrganizer.Text.ToString();
            string updateDescription = txtEditVolOppDescription.Text.ToString();

            int submit = 
                _volOppManager.SaveVolOppEdit
                (editId, updateName, updateLocation, updateDate, updateOrganizer, updateDescription);

           
            this.Close();
        }

        private void btnSignUp_Click(object sender, RoutedEventArgs e)
        {
            //string signUpId = editOppId.Text.ToString();

            



        }
    }
}
