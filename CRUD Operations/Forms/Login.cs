using CRUD_Operations.Forms;
using CRUD_Operations.Forms.Panel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CRUD_Operations
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            login_username.Font = new Font(login_username.Font, FontStyle.Bold);
            login_password.Font = new Font(login_password.Font, FontStyle.Bold);
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            var con = Configuration.getInstance().getConnection();

            string query = "EXEC AuthenticateUser @Username = @Name, @Password = @Pass";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", login_username.Text);
            cmd.Parameters.AddWithValue("@Pass", login_password.Text);

            DataTable dt = new DataTable();
            using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
            {
                adapter.Fill(dt);
            }

            if (dt.Rows.Count > 0)
            {
                int accounttype = int.Parse(dt.Rows[0]["AccountType"].ToString());
                LoggedInUser.UserID = int.Parse(dt.Rows[0]["UserID"].ToString());
                LoggedInUser.UserName = login_username.Text;
                LoggedInUser.Password = login_password.Text;
                MessageBox.Show($"Logged In as {LoggedInUser.UserName}");
                if (accounttype == 1)
                {
                    Reddit_Dashboard form = new Reddit_Dashboard();
                    form.Show();
                    this.Hide();
                }
                else if (accounttype == 2)
                {
                    FB_Dashboard form = new FB_Dashboard();
                    form.Show();
                    this.Hide();
                }
            }
        }

        private void login_showPass_CheckedChanged(object sender, EventArgs e)
        {
            login_password.PasswordChar = login_showPass.Checked ? '\0' : '*';
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

        private void guna2HtmlLabel1_Click(object sender, EventArgs e)
        {
            NewUser form = new NewUser();
            form.Show();
            this.Hide();
        }
    }
}
