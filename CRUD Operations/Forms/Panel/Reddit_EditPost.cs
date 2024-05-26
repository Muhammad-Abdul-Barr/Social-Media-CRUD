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
    public partial class Reddit_EditPost : UserControl
    {
        public static int postid;
        public Reddit_EditPost()
        {
            InitializeComponent();
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            try
            {
                var con = Configuration.getInstance().getConnection();

                SqlCommand command = new SqlCommand("EXEC sp_Update_RedditPost @PostID=@pID, @Title=@pt,@Time=@t", con);

                // Add parameters
                command.Parameters.AddWithValue("@pID", postid);
                command.Parameters.AddWithValue("@pt", login_username.Text);
                command.Parameters.AddWithValue("@t", DateTime.Now);

                int rowsAffected = command.ExecuteNonQuery();

                MessageBox.Show("Post Editied successfully. YOu may now close the window.");
            }
            catch (Exception ex)
            {

            }
        }
    }
}
