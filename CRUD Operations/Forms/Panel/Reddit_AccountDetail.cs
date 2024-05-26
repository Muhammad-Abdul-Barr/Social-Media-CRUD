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
    public partial class Reddit_AccountDetail : UserControl
    {
        public Reddit_AccountDetail()
        {
            InitializeComponent();
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            Reddit_UpdateCredentials form = new Reddit_UpdateCredentials();
            Reddit_Dashboard.pp.panel3.Controls.Clear();
            Reddit_Dashboard.pp.panel3.Controls.Add(form);
            Reddit_Dashboard.pp.Show();
        }

        private void Reddit_AccountDetail_Load(object sender, EventArgs e)
        {
            try
            {
                var connect = Configuration.getInstance().getConnection();
                String selectData = "EXEC get_RedditUserByCredss @name=@n,@password= @p";
                using (SqlCommand cmd = new SqlCommand(selectData, connect))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    cmd.Parameters.AddWithValue("@n", LoggedInUser.UserName);
                    cmd.Parameters.AddWithValue("@p", LoggedInUser.Password);
                    DataTable table = new DataTable();
                    adapter.Fill(table);
                    login_username.Text = table.Rows[0]["UserName"].ToString();
                    guna2TextBox1.Text = table.Rows[0]["Password"].ToString();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }
    }
}
