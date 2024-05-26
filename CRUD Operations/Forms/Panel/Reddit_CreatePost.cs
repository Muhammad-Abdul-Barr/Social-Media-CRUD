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
using System.Windows.Forms;

namespace CRUD_Operations.Forms.Panel
{
    public partial class Reddit_CreatePost : UserControl
    {
        public Reddit_CreatePost()
        {
            InitializeComponent();
        }

        private void Reddit_CreatePost_Load(object sender, EventArgs e)
        {
            PopulateComboBoxTable(guna2ComboBox1, FetchSubreddit(), "SubredditName");
        }
        private void PopulateComboBoxTable(System.Windows.Forms.ComboBox cb, DataTable dt, string column)
        {
            cb.Items.Clear();
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    cb.Items.Add(row[column].ToString());
                }
            }
        }
        private DataTable FetchSubreddit()
        {
            try
            {
                var connect = Configuration.getInstance().getConnection();
                String selectData = "SELECT SubredditName FROM Subreddit";
                using (SqlCommand cmd = new SqlCommand(selectData, connect))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable table = new DataTable();
                    adapter.Fill(table);
                    return table;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            return null;
        }
        private int FetchSubredditID(string pagename)
        {
            try
            {
                var connect = Configuration.getInstance().getConnection();
                String selectData = "SELECT SubredditID FROM Subreddit where PageName = @pg";
                using (SqlCommand cmd = new SqlCommand(selectData, connect))
                {
                    cmd.Parameters.AddWithValue("@pg", pagename);
                    int id = Convert.ToInt32(cmd.ExecuteScalar());
                    return id;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            return -1;
        }
        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            try
            {
                var con = Configuration.getInstance().getConnection();

                SqlCommand command = new SqlCommand("EXEC sp_InsertReddit_Post @SubredditID=@pID,@TimePosted=@time,@UserID=@uID,@PostText=@pt", con);

                // Add parameters
                command.Parameters.AddWithValue("@pt", login_username.Text);
                string pageName = guna2ComboBox1.SelectedItem.ToString();
                command.Parameters.AddWithValue("@pID", FetchSubredditID(pageName)); // Assuming PageID is stored as an integer in the combobox
                command.Parameters.AddWithValue("@uID", LoggedInUser.UserID); // Assuming UserID is stored as an integer in the combobox
                command.Parameters.AddWithValue("@time", DateTime.Now); // Assuming you want to record the current timestamp

                // Execute the stored procedure
                int rowsAffected = command.ExecuteNonQuery();

                MessageBox.Show("FB Created successfully.");
            }
            catch (Exception ex)
            {

            }
        }
    }
}
