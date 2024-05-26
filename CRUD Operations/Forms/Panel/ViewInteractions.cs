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
    public partial class ViewInteractions : UserControl
    {
        public static int postid;
        public ViewInteractions()
        {
            InitializeComponent();
        }

        private void ViewInteractions_Load(object sender, EventArgs e)
        {
            try
            {
                var con = Configuration.getInstance().getConnection();
                string query = "SELECT * FROM Facebook_Interaction_View WHERE PostID=@pid;";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@pid", postid);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                guna2DataGridView1.DataSource = dt;

                guna2DataGridView1.Columns[0].Visible = false;
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
