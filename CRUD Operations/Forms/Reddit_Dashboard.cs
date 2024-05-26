using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CRUD_Operations.Forms.Panel
{
    public partial class Reddit_Dashboard : Form
    {
        public static PopupForm pp = new PopupForm();
        private static Reddit_AccountDetail reddit_AccountDetail = new Reddit_AccountDetail();
        private static Reddit_CreatePost reddit_CreatePost = new Reddit_CreatePost();
        private static Reddit_Posts reddit_Posts = new Reddit_Posts();
        private static Subreddits subreddit = new Subreddits();

        public Reddit_Dashboard()
        {
            InitializeComponent();
            panel3.Controls.Add(reddit_AccountDetail);
            panel3.Controls.Add(reddit_CreatePost);
            panel3.Controls.Add(reddit_Posts);
            panel3.Controls.Add(subreddit);
        }

        private void AboutUsBtn_Click(object sender, EventArgs e)
        {
            reddit_AccountDetail.Visible = true;
            reddit_CreatePost.Visible = false;
            reddit_Posts.Visible = false;
            subreddit.Visible = false;
        }

        private void guna2Button1_Click(object sender, EventArgs e)
        {
            reddit_CreatePost.Visible = false;
            reddit_AccountDetail.Visible = false;
            reddit_Posts.Visible = true;
            subreddit.Visible = false;
        }

        private void guna2Button4_Click(object sender, EventArgs e)
        {
            reddit_CreatePost.Visible = false;
            reddit_AccountDetail.Visible = false;
            reddit_Posts.Visible = false;
            subreddit.Visible = true;
        }

        private void guna2Button6_Click(object sender, EventArgs e)
        {
            reddit_CreatePost.Visible = true;
            reddit_AccountDetail.Visible = false;
            reddit_Posts.Visible = false;
            subreddit.Visible = false;
        }

        private void guna2Button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void guna2Button3_Click(object sender, EventArgs e)
        {
            Form1 form1 = new Form1();
            form1.Show();
            this.Hide();
        }
    }
}
