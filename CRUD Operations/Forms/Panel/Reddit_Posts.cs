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
    public partial class Reddit_Posts : UserControl
    {
        public Reddit_Posts()
        {
            InitializeComponent();
        }

        private void guna2GradientButton5_Click(object sender, EventArgs e)
        {
            guna2DataGridView1.DataSource = null;
            var con = Configuration.getInstance().getConnection();
            string query = "EXEC stp_GetRedditPosts @UserID=@uid;";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@uid", LoggedInUser.UserID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            guna2DataGridView1.DataSource = dt;
            guna2DataGridView1.Columns["PostID"].Visible = false;
            guna2DataGridView1.Columns["SubredditID"].Visible = false;
            guna2DataGridView1.Columns["UserID"].Visible = false;
        }

        private void Reddit_Posts_Load(object sender, EventArgs e)
        {
            guna2DataGridView1.DataSource = null;
            var con = Configuration.getInstance().getConnection();
            string query = "EXEC stp_GetRedditPosts @UserID=@uid;";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@uid", LoggedInUser.UserID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            guna2DataGridView1.DataSource = dt;
            guna2DataGridView1.Columns["PostID"].Visible = false;
            guna2DataGridView1.Columns["SubredditID"].Visible = false;
            guna2DataGridView1.Columns["UserID"].Visible = false;
        }

        private void guna2GradientButton2_Click(object sender, EventArgs e)
        {
            if (guna2DataGridView1.SelectedRows.Count > 0)
            {
                Reddit_Interact form = new Reddit_Interact();
                Reddit_Interact.postid = int.Parse(guna2DataGridView1.SelectedRows[0].Cells["PostID"].Value.ToString());
                Reddit_Dashboard.pp.panel3.Controls.Clear();
                Reddit_Dashboard.pp.panel3.Controls.Add(form);
                Reddit_Dashboard.pp.Show();
            }
            else
            {
                MessageBox.Show("Please Select a Post.");
            }
        }

        private void guna2GradientButton4_Click(object sender, EventArgs e)
        {
            if (guna2DataGridView1.SelectedRows.Count > 0)
            {
                Reddit_ViewInteractions form = new Reddit_ViewInteractions();
                Reddit_ViewInteractions.postid = int.Parse(guna2DataGridView1.SelectedRows[0].Cells["PostID"].Value.ToString());
                Reddit_Dashboard.pp.panel3.Controls.Clear();
                Reddit_Dashboard.pp.panel3.Controls.Add(form);
                Reddit_Dashboard.pp.Show();
            }
            else
            {
                MessageBox.Show("Please select a Post.");
            }
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            if (guna2DataGridView1.SelectedRows.Count > 0)
            {
                int OwnerID = int.Parse(guna2DataGridView1.SelectedRows[0].Cells["UserID"].Value.ToString());
                if (LoggedInUser.UserID == OwnerID)
                {
                    EditPost form = new EditPost();
                    EditPost.postid = int.Parse(guna2DataGridView1.SelectedRows[0].Cells["PostID"].Value.ToString());
                    FB_Dashboard.pp.panel3.Controls.Clear();
                    FB_Dashboard.pp.panel3.Controls.Add(form);
                    FB_Dashboard.pp.Show();
                }
                else
                {
                    MessageBox.Show("You are not Subreddit Admin");
                }
            }
            else
            {
                MessageBox.Show("Please Select a Post.");
            }
        }

        private void guna2GradientButton3_Click(object sender, EventArgs e)
        {
            if (guna2DataGridView1.SelectedRows.Count > 0)
            {
                int OwnerID = int.Parse(guna2DataGridView1.SelectedRows[0].Cells["UserID"].Value.ToString());
                if (LoggedInUser.UserID == OwnerID)
                {
                    DialogResult result = MessageBox.Show("Are you sure you want to delete?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (result == DialogResult.Yes)
                    {
                        try
                        {
                            int Pid = int.Parse(guna2DataGridView1.SelectedRows[0].Cells["PostID"].Value.ToString());
                            var con = Configuration.getInstance().getConnection();

                            string query = "EXEC del_RedditInteractionsByPostID @id = @Pageid;";
                            SqlCommand cmd3 = new SqlCommand(query, con);
                            cmd3.Parameters.AddWithValue("@Pageid", Pid);
                            cmd3.ExecuteNonQuery();

                            query = "EXEC del_RedditPostByID @id = @Pageid;";
                            SqlCommand cmd2 = new SqlCommand(query, con);
                            cmd2.Parameters.AddWithValue("@Pageid", Pid);
                            cmd2.ExecuteNonQuery();

                            MessageBox.Show("Deleted Succesfully");
                        }
                        catch (Exception ex)
                        {

                        }
                    }
                }
                else
                {
                    MessageBox.Show("You are not the Author Of Post");
                }
            }
            else
            {
                MessageBox.Show("Please Select a Post.");
            }
        }
    }
}
