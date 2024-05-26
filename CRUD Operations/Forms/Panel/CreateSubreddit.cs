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
    public partial class CreateSubreddit : UserControl
    {
        public CreateSubreddit()
        {
            InitializeComponent();
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            try
            {
                var con = Configuration.getInstance().getConnection();

                SqlCommand command = new SqlCommand("EXEC stp_CreateSubreddit @Name=@Pn,@CreatedBy=@Crby,@Time=t;", con);

                command.Parameters.AddWithValue("@Pn", login_username.Text);
                command.Parameters.AddWithValue("@Crby", LoggedInUser.UserID);
                command.Parameters.AddWithValue("@t", DateTime.Now);

                command.ExecuteNonQuery();
                MessageBox.Show("Subreddit Created Succesfully. You may now close the Window.");

            }
            catch (Exception ex)
            {
                MessageBox.Show("An error occurred: " + ex.Message);
            }
        }
    }
}
