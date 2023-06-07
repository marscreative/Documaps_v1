using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace BMIS
{
    public partial class FrmLogincs : Form
    {
        private const string Username = "admin";
        private const string Password = "admin";

   
        public FrmLogincs()
        {
            InitializeComponent();
        }

        private void FrmLogincs_Load(object sender, EventArgs e)
        {

        }

        private void LoginButton_Click(object sender, EventArgs e)
        {
            string username = UsernameTextBox.Text;
            string password = PasswordTextBox.Text;

            if (username == Username && password == Password)
            {
                MessageBox.Show("Login successful!");
                // Perform any actions needed upon successful login
                Form1 mainForm = new Form1();
                mainForm.Show();
                this.Hide(); // Hide the login form
            }
            else
            {
                MessageBox.Show("Invalid username or password.");
                // Clear the password field to prevent re-use
                PasswordTextBox.Text = "";
            }
        }

        private void CancelButton_Click(object sender, EventArgs e)
        {
            // Clear both fields and set focus to the username field
            UsernameTextBox.Text = "";
            PasswordTextBox.Text = "";
            UsernameTextBox.Focus();
        }

        private void ExitButton_Click(object sender, EventArgs e)
        {
            // Close the application
            Application.Exit();
        }
    }
}
