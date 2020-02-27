using System;
using DataObjects;
using LogicLayer;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
//using System.Windows.Forms;

namespace PresentationLayer
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private User _user = null;

        private IUserManager _userManager;
        private IVolOppManager _volOppManager;

        public MainWindow()
        {
            InitializeComponent();
            _userManager = new UserManager();
            _volOppManager = new VolOppManager();
        }

        private void Window_Loaded1(object sender, RoutedEventArgs e)
        {
            DataObjects.AppDetails.AppPath = AppContext.BaseDirectory;
            imgEvents.Source = new BitmapImage(new Uri(AppDetails.ImagePath + "bulletinBoard.jpg"));
            sopicon.Source = new BitmapImage(new Uri(AppDetails.ImagePath + "sop.jpg"));
            imgVolOpps.Source = new BitmapImage(new Uri(AppDetails.ImagePath + "volunteer2.jpg"));
            imgHomeBG.ImageSource = new BitmapImage(new Uri(AppDetails.ImagePath + "background.jpg"));


        }

        private void Btn_VolOpp_Create_Click(object sender, RoutedEventArgs e)
        {
            frmCreateVolOpp cVol = new frmCreateVolOpp();

            cVol.Show();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        //private void BtnCreate_Click(object sender, RoutedEventArgs e)
        //{
        //    frmCreateVolOpp createOpp = new frmCreateVolOpp();

        //    createOpp.Show();
        //}

        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            var email = txtEmail.Text;
            var password = pwdPassword.Password;

            //if (btnLogin.Content.ToString() == "Logout")
            //{
            //    logoutUser();
            //    return;
            //}

            if (email.Length < 5 || password.Length < 5)
            {
                MessageBox.Show("Bad username or password.",
                    "Login Failed", MessageBoxButton.OK, MessageBoxImage.Error);
                txtEmail.Text = "";
                pwdPassword.Password = "";
                txtEmail.Focus();
                return;
            }
            // try to login
            try
            {
                _user = _userManager.AuthUser(email, password);

                //string message = "Welcome";

                //lblStatusMessage.Content = message;

                if (pwdPassword.Password == "newuser")
                {
                    var updatePassword = new frmUpdatePassword(_user, _userManager);
                    if (updatePassword.ShowDialog() == false)
                    {
                        // code to logout the user
                        logoutUser();
                        MessageBox.Show("You must change your password to continue.");
                        return;
                    }
                }

                //reset the login
                //btnLogin.Content = "Logout";
                txtEmail.Text = "";
                pwdPassword.Password = "";
                txtEmail.IsEnabled = false;
                pwdPassword.IsEnabled = false;
                txtEmail.Visibility = Visibility.Hidden;
                pwdPassword.Visibility = Visibility.Hidden;
                lblUsername.Visibility = Visibility.Hidden;
                lblPassword.Visibility = Visibility.Hidden;
                tabProfile.Visibility = Visibility.Visible;
                tabVolunteer.Visibility = Visibility.Visible;
                tabEvents.Visibility = Visibility.Visible;
                tabOrgs.Visibility = Visibility.Visible;
                tabGroups.Visibility = Visibility.Visible;
                tabPoints.Visibility = Visibility.Visible;
                btnLogout.Visibility = Visibility.Visible;
                btnLogin.Visibility = Visibility.Hidden;
                lblWelcome.Visibility = Visibility.Visible;
                lblUserlogged.Content = _user.FirstName.ToString();
                lblUserlogged.Visibility = Visibility.Visible;
                //MessageBox.Show(_volOppManager.GetVolOppById("1000001").VolOppId.ToString());
                //lblEmail.Visibility = Visibility.Hidden;
                //lblPassword.Visibility = Visibility.Hidden;
                //showUserTabs();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + "\n\n"
                    + ex.InnerException.Message,
                    "Login Failed",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void logoutUser()
        {
            _user = null;
            txtEmail.IsEnabled = true;
            pwdPassword.IsEnabled = true;
            txtEmail.Visibility = Visibility.Visible;
            pwdPassword.Visibility = Visibility.Visible;
            lblUsername.Visibility = Visibility.Visible;
            lblPassword.Visibility = Visibility.Visible;
            tabProfile.Visibility = Visibility.Hidden;
            tabVolunteer.Visibility = Visibility.Hidden;
            tabEvents.Visibility = Visibility.Hidden;
            tabOrgs.Visibility = Visibility.Hidden;
            tabGroups.Visibility = Visibility.Hidden;
            tabPoints.Visibility = Visibility.Hidden;
            btnLogout.Visibility = Visibility.Hidden;
            btnLogin.Visibility = Visibility.Visible;
            lblWelcome.Visibility = Visibility.Hidden;
            lblUserlogged.Content = "USERNAME";
            lblUserlogged.Visibility = Visibility.Hidden;
            //dgVolOppList.ItemsSource = null;
            tabHome.Focus();


            return;
        }

        private void btnLogout_Click(object sender, RoutedEventArgs e)
        {
            logoutUser();
        }

        private void tabVolunteer_Loaded(object sender, RoutedEventArgs e)
        {
            DataTable dt = new DataTable();
            List<VolOppVM> vOpps = _volOppManager.GetAllVolOpps();

            foreach (VolOppVM volOpp in vOpps)
            {
                dgVolOppList.ItemsSource = _volOppManager.GetAllVolOpps();

                //lstVolOpps.Items.Add(volOpp.volOppName.ToString(), volOpp.oppDate.ToString(), volOpp.oppLocation.ToString(), volOpp.organizer.ToString(), volOpp.description.ToString());
                //CREATE OVERRIDE TO STRING METHOD
                //lstVolOpps.Items.Add(volOpp.MyToString());

                //lstVolOpps.Items.Add(volOpp.volOppName.ToString());
                //lstVolOpps.Items.Add(volOpp.oppDate.ToString());
                //lstVolOpps.Items.Add(volOpp.oppLocation.ToString());
                //lstVolOpps.Items.Add(volOpp.organizer.ToString());
                //lstVolOpps.Items.Add(volOpp.description.ToString());
            }

            //lstVolOpps.Items.Add(vOpps.ToString());


            //dt.Columns.Add("VolOppName");
            //dt.Columns.Add("Date");
            //dt.Columns.Add("Location");
            //dt.Columns.Add("Organizer");
            //dt.Columns.Add("Description");

            //foreach (VolOppVM item in vOpps)
            //{
            //    var row = dt.NewRow();
            //    row["VolOppName"] = item.volOppName;
            //    row["Date"] = item.oppDate;
            //    row["Location"] = item.oppLocation;
            //    row["Organizer"] = item.organizer;
            //    row["Description"] = item.description;

            //    dt.Rows.Add(row);
            //}

            //foreach (DataRow row in dt.Rows)
            //{
            //    //ListViewItem item = new ListViewItem();
            //    lstVolOpps.Items.Add(row.ToString());
            //    //item.Content = row["VolOppName"].ToString();



            //    //lstVolOpps.Items.Add(lvi);


            //}



        }

        private void btn_VolOpp_Refresh_Click(object sender, RoutedEventArgs e)
        {
            //dgVolOppList.Items.Clear();
            dgVolOppList.ItemsSource = null;
            dgVolOppList.ItemsSource = _volOppManager.GetAllVolOpps();

        }

        private void dgVolOppList_ColumnHeaders(object sender, EventArgs e)
        {
            dgVolOppList.Columns[0].Header = "Opp Id";
            dgVolOppList.Columns[1].Header = "Volunteer Opprotunity";
            dgVolOppList.Columns[2].Header = "Location";
            dgVolOppList.Columns[3].Header = "Organizer";
            dgVolOppList.Columns[4].Header = "Date";
            dgVolOppList.Columns[5].Header = "Description";
        }

        private void tabVolunteer_GotFocus(object sender, RoutedEventArgs e)
        {
            //btnCreate.Visibility = Visibility.Visible;
        }

        private void dgVolOppList_MouseUp(object sender, MouseButtonEventArgs e)
        {
            //btn_VolOpp_Edit.Visibility = Visibility.Visible;
            //btn_VolOpp_Delete.Visibility = Visibility.Visible;
        }

        private void dgVolOppList_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            VolOppVM gotOppVM = (VolOppVM)dgVolOppList.SelectedItem;
            //MessageBox.Show("Selected " + selectedItem.volOppName);
            //VolOppVM selectedOpp = (VolOppVM)dgVolOppList.SelectedItem;

            VolOpp gotOpp = _volOppManager.GetVolOppById(gotOppVM.volOppId.ToString());

            //MessageBox.Show("gotOpp " + gotOpp.VolOppId.ToString());

            frmEditVolOpp editSelectedVolOpp = new frmEditVolOpp();

            editSelectedVolOpp.txtEditVolOppName.Text = gotOpp.VolOppName.ToString();
            editSelectedVolOpp.txtEditVolOppLocation.Text = gotOpp.Location.ToString();
            editSelectedVolOpp.txtEditVolOppOrganizer.Text = gotOpp.Organizer.ToString();
            editSelectedVolOpp.txtEditVolOppDescription.Text = gotOpp.Description.ToString();
            editSelectedVolOpp.txtEditVolOppDate.Text = gotOpp.OppDate.ToString();
            editSelectedVolOpp.editOppId.Text = gotOpp.VolOppId.ToString();
           // editSelectedVolOpp.dpEditVolOppDate.SelectedDate.GetValueOrDefault(gotOpp.oppDate);

            editSelectedVolOpp.Show();
        }

        //private void btn_Opp_Create_Click(object sender, RoutedEventArgs e)
        //{
        //    frmCreateVolOpp createAnOpp = new frmCreateVolOpp();
        //    createAnOpp.Show();
        //}

       



        //private void btn_VolOpp_Edit_Click(object sender, RoutedEventArgs e)
        //{
        //    //int indexRow = dgVolOppList.SelectedIndex;

        //    //int selectedId = int.Parse(dgVolOppList.SelectedCells[1].ToString());

        //    //int selectedId = dgVolOppList.Columns[0].GetCellContent.GetValue();

        //    //object item = dgVolOppList.SelectedItem;

        //    //string selectId = (dgVolOppList.SelectedCells[0].Column.GetCellContent(item) as TextBlock).Text;
        //    //string selectId = (dgVolOppList.SelectedItem as VolOppVM).volOppId.ToString();
        //    //dgVolOppList.
        //    //int selectedId = int.Parse(selectId);

        //    ////int selectedId = selectedOppId.volOppId;







        //    VolOppVM selectedOppItem = (VolOppVM)dgVolOppList.SelectedItem;

        //    frmEditVolOpp editSelectedVolOpp = new frmEditVolOpp();
        //    VolOpp selectedOpp = _volOppManager.GetVolOppById(selectedOppItem.volOppId);


        //    editSelectedVolOpp.txtEditVolOppName.Text = selectedOpp.VolOppName.ToString();
        //    editSelectedVolOpp.txtEditVolOppLocation.Text = selectedOpp.Location.ToString();
        //    editSelectedVolOpp.txtEditVolOppOrganizer.Text = selectedOpp.Organizer.ToString();
        //    editSelectedVolOpp.txtEditVolOppDescription.Text = selectedOpp.Description.ToString();
        //    editSelectedVolOpp.dpEditVolOppDate.SelectedDate.GetValueOrDefault(selectedOpp.OppDate);

        //    editSelectedVolOpp.Show();



        //}
    }
}
