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

namespace CRUD_Operations.Forms.Panel
{
    public partial class Reddit_UpdateCredentials : UserControl
    {
        public Reddit_UpdateCredentials()
        {
            InitializeComponent();
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            if (guna2TextBox1.Text == "" || login_username.Text == "")
            {
                MessageBox.Show("Please fill in all fields.");
                return;
            }
            try
            {
                var con = Configuration.getInstance().getConnection();

                // Prepare the SQL command for inserting user using stored procedure
                SqlCommand cmd = new SqlCommand("EXEC std_UpdateSocialUser @UserID=@uid, @UserName=@un,  @Password=@pd", con);
                cmd.Parameters.AddWithValue("@UN", login_username.Text);
                cmd.Parameters.AddWithValue("@uid", LoggedInUser.UserID);
                cmd.Parameters.AddWithValue("@Pd", guna2TextBox1.Text);

                // Execute the stored procedure
                int rowsAffected = cmd.ExecuteNonQuery();

                MessageBox.Show("User saved successfully.");
            }
            catch (Exception ex)
            {
                MessageBox.Show("An error occurred: " + ex.Message);
            }
        }
    }
}
