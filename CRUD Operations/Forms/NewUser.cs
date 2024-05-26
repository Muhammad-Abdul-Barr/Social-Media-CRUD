using CRUD_Operations.Forms.Panel;
using Guna.UI2.WinForms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Security;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace CRUD_Operations.Forms
{
    public partial class NewUser : Form
    {
        public NewUser()
        {
            InitializeComponent();
            login_username.Font = new Font(login_username.Font, FontStyle.Bold);
            login_password.Font = new Font(login_password.Font, FontStyle.Bold);
        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void guna2GradientPanel2_Paint(object sender, PaintEventArgs e)
        {
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            if (login_username.Text == "" || login_password.Text == "")
            {
                MessageBox.Show("Please fill all the fields");
            }
            else
            {
                try
                {
                    var con = Configuration.getInstance().getConnection();

                    // Prepare the SQL command for inserting user using stored procedure
                    SqlCommand cmd = new SqlCommand("EXEC sp_Insert_SocialUser @un,  @pd,@AY,@c;", con);
                    // Add parameters
                    int accountType = 0;
                    if (guna2ComboBox1.SelectedItem.ToString() == "Facebook")
                    {
                        accountType = 2;
                    }
                    else if (guna2ComboBox1.SelectedItem.ToString() == "Reddit")
                    {
                        accountType = 1;
                    }
                    cmd.Parameters.AddWithValue("@un", login_username.Text);
                    cmd.Parameters.AddWithValue("@AY", accountType);
                    cmd.Parameters.AddWithValue("@c", DateTime.Now);
                    cmd.Parameters.AddWithValue("@pd", login_password.Text);
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("User saved successfully.");
                    LoggedInUser.UserName = login_username.Text;
                    LoggedInUser.Password = login_password.Text;
                    if (guna2ComboBox1.SelectedItem.ToString() == "Facebook")
                    {
                        NewFBUserDetails form = new NewFBUserDetails();
                        form.Show();
                        this.Hide();
                    }
                    else if (guna2ComboBox1.SelectedItem.ToString() == "Reddit")
                    {
                        try
                        {
                            SqlCommand command = new SqlCommand("INSERT INTO [dbo].[Reddit_User] ([UserID],[PostKarma], [CommentKarma]) VALUES (@id, @P, @C);", con);

                            int id = FetchTopID();
                            command.Parameters.AddWithValue("@id", id); // Assuming Country is stored as an integer in the 
                            command.Parameters.AddWithValue("@P", 0);
                            command.Parameters.AddWithValue("@C", 0);
                            // Execute the stored procedure
                            command.ExecuteNonQuery();
                            MessageBox.Show("Fb_User inserted successfully.");
                            LoggedInUser.UserID = id;
                            Reddit_Dashboard form = new Reddit_Dashboard();
                            form.Show();
                            this.Hide();
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("An error occurred: " + ex.Message);
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("An error occurred: " + ex.Message);
                }
            }

        }
        public static int FetchTopID()
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("select max(UserID) from SocialUser", con);
            int id = Convert.ToInt32(cmd.ExecuteScalar());
            return id;
        }
        private void login_username_TextChanged(object sender, EventArgs e)
        {
            if (login_username.Text == "")
            {
                login_username.Font = new Font(login_username.Font, FontStyle.Bold);
            }
            else
            {
                login_username.Font = new Font(login_username.Font, FontStyle.Regular);
            }
        }

        private void login_password_TextChanged(object sender, EventArgs e)
        {
            if (login_password.Text == "")
            {
                login_password.Font = new Font(login_password.Font, FontStyle.Bold);
            }
            else
            {
                login_password.Font = new Font(login_password.Font, FontStyle.Regular);
            }
        }

        private void guna2Button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
