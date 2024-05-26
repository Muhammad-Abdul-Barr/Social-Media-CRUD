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
    public partial class CreatePage : UserControl
    {
        public CreatePage()
        {
            InitializeComponent();
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

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            try
            {
                var con = Configuration.getInstance().getConnection();

                SqlCommand command = new SqlCommand("EXEC stp_CreatePage @PageName=@Pn, @PageFollowerCount=@Pfc,@PageCategory=@PC,@CreatedBy=@Crby;", con);

                int pagetype = FetchPageCat(guna2ComboBox1.SelectedItem.ToString());
                command.Parameters.AddWithValue("@Pn", login_username.Text);
                command.Parameters.AddWithValue("@Pfc", 0);
                command.Parameters.AddWithValue("@PC", pagetype);
                command.Parameters.AddWithValue("@Crby", LoggedInUser.UserID);

                command.ExecuteNonQuery();
                MessageBox.Show("Page Created Succesfully. You may now close the Window.");

            }
            catch (Exception ex)
            {
                MessageBox.Show("An error occurred: " + ex.Message);
            }

        }

        private void guna2Button2_Click(object sender, EventArgs e)
        {
            this.Visible = false;
        }
        private static int FetchPageCat(string cat)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("select ID from Lookup where data like @data", con);
            cmd.Parameters.AddWithValue("@data", cat);
            int id = Convert.ToInt32(cmd.ExecuteScalar());
            return id;
        }
    }
}
