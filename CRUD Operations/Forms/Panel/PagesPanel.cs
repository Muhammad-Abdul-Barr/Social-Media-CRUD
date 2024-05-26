using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CRUD_Operations.Forms.Panel
{
    public partial class PagesPanel : UserControl
    {
        public PagesPanel()
        {
            InitializeComponent();
        }

        private void guna2GradientButton4_Click(object sender, EventArgs e)
        {
            CreatePage createPage = new CreatePage();
            FB_Dashboard.pp.panel3.Controls.Clear();
            FB_Dashboard.pp.panel3.Controls.Add(createPage);
            FB_Dashboard.pp.Show();
        }

        private void guna2GradientButton2_Click(object sender, EventArgs e)
        {
            if (guna2DataGridView1.SelectedRows.Count > 0)
            {
                DialogResult result = MessageBox.Show("You want to Join?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {
                    try
                    {
                        int Pid = int.Parse(guna2DataGridView1.SelectedRows[0].Cells["ID"].Value.ToString());
                        var con = Configuration.getInstance().getConnection();
                        string query = "EXEC stp_readFollowerStatus @id = @Pageid, @UserID=@uid;";
                        SqlCommand cmd = new SqlCommand(query, con);

                        cmd.Parameters.AddWithValue("@Pageid", Pid);
                        cmd.Parameters.AddWithValue("@uid", LoggedInUser.UserID);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if (dt.Rows.Count <= 0)
                        {
                            query = "EXEC stp_JoinPage @id = @Pageid, @UserID=@uid, @time=@dt;";
                            SqlCommand cmd2 = new SqlCommand(query, con);
                            cmd2.Parameters.AddWithValue("@Pageid", Pid);
                            cmd2.Parameters.AddWithValue("@uid", LoggedInUser.UserID);
                            cmd2.Parameters.AddWithValue("@dt", DateTime.Now);
                            cmd2.ExecuteNonQuery();
                            MessageBox.Show("Followed");
                        }
                        else
                        {
                            MessageBox.Show("Already Joined");
                        }
                    }
                    catch (Exception ex)
                    {

                    }
                }
            }
            else
            {
                MessageBox.Show("Please select a row to edit.");
            }
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            if (guna2DataGridView1.SelectedRows.Count > 0)
            {
                int OwnerID = int.Parse(guna2DataGridView1.SelectedRows[0].Cells["OwnerID"].Value.ToString());
                if (LoggedInUser.UserID == OwnerID)
                {
                    EditPage form = new EditPage();
                    EditPage.pageid = int.Parse(guna2DataGridView1.SelectedRows[0].Cells["ID"].Value.ToString());
                    FB_Dashboard.pp.panel3.Controls.Clear();
                    FB_Dashboard.pp.panel3.Controls.Add(form);
                    FB_Dashboard.pp.Show();
                }
                else
                {
                    MessageBox.Show("You are not Page Admin");
                }
            }
            else
            {
                MessageBox.Show("Please select a row to edit.");
            }
        }

        private void guna2GradientButton3_Click(object sender, EventArgs e)
        {
            if (guna2DataGridView1.SelectedRows.Count > 0)
            {
                int OwnerID = int.Parse(guna2DataGridView1.SelectedRows[0].Cells["OwnerID"].Value.ToString());
                if (LoggedInUser.UserID == OwnerID)
                {
                    DialogResult result = MessageBox.Show("Are you sure you want to delete?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (result == DialogResult.Yes)
                    {
                        try
                        {

                            int Pid = int.Parse(guna2DataGridView1.SelectedRows[0].Cells["ID"].Value.ToString());
                            var con = Configuration.getInstance().getConnection();

                            string query = "EXEC  del_PageFollowersByPageID @id = @Pageid;";
                            SqlCommand cmd4 = new SqlCommand(query, con);
                            cmd4.Parameters.AddWithValue("@Pageid", Pid);
                            cmd4.ExecuteNonQuery();

                            query = "EXEC  del_InteractionsByPageID @id = @Pageid;";
                            SqlCommand cmd3 = new SqlCommand(query, con);
                            cmd3.Parameters.AddWithValue("@Pageid", Pid);
                            cmd3.ExecuteNonQuery();


                            query = "EXEC del_PostsByPageID @id = @Pageid;";
                            SqlCommand cmd2 = new SqlCommand(query, con);
                            cmd2.Parameters.AddWithValue("@Pageid", Pid);
                            cmd2.ExecuteNonQuery();
                            
                            query = "EXEC del_EventUsersByPageID @id = @Pageid;";
                            SqlCommand cmd5 = new SqlCommand(query, con);
                            cmd5.Parameters.AddWithValue("@Pageid", Pid);
                            cmd5.ExecuteNonQuery();

                            query = "EXEC del_EventsByPageID @id = @Pageid;";
                            SqlCommand cmd6 = new SqlCommand(query, con);
                            cmd6.Parameters.AddWithValue("@Pageid", Pid);
                            cmd6.ExecuteNonQuery();

                            MessageBox.Show("Deleted Succesfully");
                            query = "EXEC del_PageByID @id = @Pageid;";
                            SqlCommand cmd = new SqlCommand(query, con);
                            cmd.Parameters.AddWithValue("@Pageid", Pid);
                            cmd.ExecuteNonQuery();
                        }
                        catch (Exception ex)
                        {

                        }
                    }
                }
                else
                {
                    MessageBox.Show("You are not the Owner Of Page");
                }
            }
            else
            {
                MessageBox.Show("Please select a row to edit.");
            }
        }

        private void PagesPanel_Load(object sender, EventArgs e)
        {
            guna2DataGridView1.DataSource = null;
            var con = Configuration.getInstance().getConnection();
            string query = "SELECT * FROM Facebook_Pages_View WHERE ID <> 4;";
            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            guna2DataGridView1.DataSource = dt;
            guna2DataGridView1.Columns["OwnerID"].Visible = false;
            guna2DataGridView1.Columns["ID"].Visible = false;
        }

        private void guna2GradientButton5_Click(object sender, EventArgs e)
        {
            guna2DataGridView1.DataSource = null;
            var con = Configuration.getInstance().getConnection();
            string query = "SELECT * FROM Facebook_Pages_View WHERE ID <> 4;";
            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            guna2DataGridView1.DataSource = dt;
            guna2DataGridView1.Columns["OwnerID"].Visible = false;
            guna2DataGridView1.Columns["ID"].Visible = false;
        }
    }
}
