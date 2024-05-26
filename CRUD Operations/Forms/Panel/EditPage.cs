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
    public partial class EditPage : UserControl
    {
        public static int pageid;
        public EditPage()
        {
            InitializeComponent();
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(login_username.Text))
            {
                MessageBox.Show("Please fill all the fields");
                return;
            }

            try
            {
                var con = Configuration.getInstance().getConnection();

                SqlCommand command = new SqlCommand("EXEC sp_Update_Page @PageID=@id, @PageName=@Pn,@PageCategory=@PC;", con);

                // Add parameters+
                int pagetype = FetchPageCat(guna2ComboBox1.SelectedItem.ToString());
                command.Parameters.AddWithValue("@id", pageid);
                command.Parameters.AddWithValue("@Pn", login_username.Text);
                command.Parameters.AddWithValue("@PC", pagetype);

                // Execute the stored procedure
                int rowsAffected = command.ExecuteNonQuery();

                MessageBox.Show("Page updated successfully.");

            }
            catch (Exception ex)
            {

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
