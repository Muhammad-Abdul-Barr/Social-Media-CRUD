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

namespace CRUD_Operations.Forms
{
    public partial class NewFBUserDetails : Form
    {
        public NewFBUserDetails()
        {
            InitializeComponent();
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the connection
                var con = Configuration.getInstance().getConnection();

                // Prepare the SQL command for insertion using stored procedure
                SqlCommand command = new SqlCommand("INSERT INTO [dbo].[Fb_User] ([UserID], [Country], [UserGender], [FollowerCount], [DoB]) VALUES (@id, @Co, @G, @fc, @D);", con);

                // Add parameters
                int id = FetchTopID();
                command.Parameters.AddWithValue("@id", id); // Assuming Country is stored as an integer in the combobox
                command.Parameters.AddWithValue("@Co", FetchFromLookUp("COUNRY", guna2ComboBox2.SelectedItem.ToString())); // Assuming Country is stored as an integer in the combobox
                command.Parameters.AddWithValue("@G", FetchFromLookUp("GENDER", guna2ComboBox1.SelectedItem.ToString())); // Assuming Gender is stored as an integer in the combobox
                command.Parameters.AddWithValue("@D", guna2DateTimePicker1.Value);
                command.Parameters.AddWithValue("@fc", 0);

                // Execute the stored procedure
                command.ExecuteNonQuery();

                MessageBox.Show("Fb_User inserted successfully.");
                LoggedInUser.UserID = id;
                FB_Dashboard form = new FB_Dashboard();
                form.Show();
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("An error occurred: " + ex.Message);
            }

        }
        public static int FetchTopID()
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("select max(UserID) from SocialUser", con);
            int id = Convert.ToInt32(cmd.ExecuteScalar());
            return id;
        }
        public static int FetchFromLookUp(string catergory, string DATA)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("select ID from Lookup where data like @data", con);
            cmd.Parameters.AddWithValue("@data", DATA);
            int id = Convert.ToInt32(cmd.ExecuteScalar());
            return id;
        }
    }
}
