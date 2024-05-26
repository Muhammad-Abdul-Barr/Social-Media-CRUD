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
    public partial class Subreddits : UserControl
    {
        public Subreddits()
        {
            InitializeComponent();
        }

        private void guna2GradientButton4_Click(object sender, EventArgs e)
        {
            CreateSubreddit createPage = new CreateSubreddit();
            Reddit_Dashboard.pp.panel3.Controls.Clear();
            Reddit_Dashboard.pp.panel3.Controls.Add(createPage);
            Reddit_Dashboard.pp.Show();
        }

        private void Subreddits_Load(object sender, EventArgs e)
        {
            guna2DataGridView1.DataSource = null;
            var con = Configuration.getInstance().getConnection();
            string query = "SELECT * FROM Reddit_Subreddits_View;";
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
            string query = "SELECT * FROM Reddit_Subreddits_View;";
            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            guna2DataGridView1.DataSource = dt;
            guna2DataGridView1.Columns["OwnerID"].Visible = false;
            guna2DataGridView1.Columns["ID"].Visible = false;
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
                        string query = "EXEC stp_readMemberStatus @id = @Pageid, @UserID=@uid;";
                        SqlCommand cmd = new SqlCommand(query, con);

                        cmd.Parameters.AddWithValue("@Pageid", Pid);
                        cmd.Parameters.AddWithValue("@uid", LoggedInUser.UserID);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if (dt.Rows.Count <= 0)
                        {
                            query = "EXEC stp_JoinSubreddit @id = @Pageid, @UserID=@uid, @time=@dt;";
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

                            string query = "EXEC  del_RedditMembersBySubredditID @id = @Pageid;";
                            SqlCommand cmd4 = new SqlCommand(query, con);
                            cmd4.Parameters.AddWithValue("@Pageid", Pid);
                            cmd4.ExecuteNonQuery();

                            query = "EXEC  del_InteractionsBySubredditID @id = @Pageid;";
                            SqlCommand cmd3 = new SqlCommand(query, con);
                            cmd3.Parameters.AddWithValue("@Pageid", Pid);
                            cmd3.ExecuteNonQuery();

                            query = "EXEC del_PostsBySubredditID @id = @Pageid;";
                            SqlCommand cmd2 = new SqlCommand(query, con);
                            cmd2.Parameters.AddWithValue("@Pageid", Pid);
                            cmd2.ExecuteNonQuery();
                            
                            query = "EXEC del_SubredditByID @id = @Pageid;";
                            SqlCommand cmd = new SqlCommand(query, con);
                            cmd.Parameters.AddWithValue("@Pageid", Pid);
                            cmd.ExecuteNonQuery();
                            MessageBox.Show("Deleted Succesfully");
                        }
                        catch (Exception ex)
                        {

                        }
                    }
                }
                else
                {
                    MessageBox.Show("You are not the Owner Of Subreddit");
                }
            }
            else
            {
                MessageBox.Show("Please select a row to edit.");
            }
        }
    }
}
