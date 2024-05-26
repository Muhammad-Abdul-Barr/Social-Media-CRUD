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
    public partial class EditPost : UserControl
    {
        public static int postid;
        public EditPost()
        {
            InitializeComponent();
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            try
            {
                var con = Configuration.getInstance().getConnection();

                SqlCommand command = new SqlCommand("EXEC sp_Update_FbPost  @PostID=@pID, @Title=@pt ,@Caption= @cap", con);

                // Add parameters
                command.Parameters.AddWithValue("@pID", postid);
                command.Parameters.AddWithValue("@pt", login_username.Text);
                command.Parameters.AddWithValue("@cap", guna2TextBox1.Text);

                int rowsAffected = command.ExecuteNonQuery();

                MessageBox.Show("Post Editied successfully. YOu may now close the window.");
            }
            catch (Exception ex)
            {

            }
        }
    }
}
