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
    public partial class Interact : UserControl
    {
        public static int postid;
        public Interact()
        {
            InitializeComponent();
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            try
            {
                var con = Configuration.getInstance().getConnection();
                string query = "EXEC sp_InsertFb_Interaction @PostID=@Pid, @UserID=@uid, @Time=@rtm, @Comment=@comm,@Reaction=@rt;";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Pid", postid);
                cmd.Parameters.AddWithValue("@uid", LoggedInUser.UserID);
                cmd.Parameters.AddWithValue("@rt", FetchReacttype(guna2ComboBox1.SelectedItem.ToString()));
                cmd.Parameters.AddWithValue("@comm", login_username.Text);
                cmd.Parameters.AddWithValue("@rtm", DateTime.Now);

                cmd.ExecuteNonQuery();
                MessageBox.Show("Reaction Added");
            }
            catch (Exception ex)
            {
                MessageBox.Show("An error occurred: " + ex.Message);
            }
        }

        private static int FetchReacttype(string react)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("select ID from Lookup where data like @data", con);
            cmd.Parameters.AddWithValue("@data", react);
            int id = Convert.ToInt32(cmd.ExecuteScalar());
            return id;
        }
    }
}
