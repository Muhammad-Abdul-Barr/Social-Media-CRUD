using CRUD_Operations.Forms.Panel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace CRUD_Operations.Forms
{
    public partial class FB_Dashboard : Form
    {
        public static PopupForm pp= new PopupForm();
        private static PagesPanel pagesPanel= new PagesPanel();
        private static CreatePost createpost = new CreatePost();
        private static AccountDetails accountDetails = new AccountDetails();
        private static ViewPosts viewPosts = new ViewPosts();

        public FB_Dashboard()
        {
            InitializeComponent();
            panel3.Controls.Add(pagesPanel);
            panel3.Controls.Add(accountDetails);
            panel3.Controls.Add(createpost);
            panel3.Controls.Add(viewPosts);
        }

        private void guna2Button4_Click(object sender, EventArgs e)
        {
            pagesPanel.Visible = true;
            createpost.Visible = false;
            accountDetails.Visible = false;
            viewPosts.Visible = false;
        }

        private void guna2Button1_Click(object sender, EventArgs e)
        {
            viewPosts.Visible = true;
            pagesPanel.Visible = false;
            createpost.Visible = false;
            accountDetails.Visible = false;
        }

        private void guna2Button6_Click(object sender, EventArgs e)
        {
            createpost.Visible = true;
            pagesPanel.Visible = false;
            accountDetails.Visible = false;
            viewPosts.Visible = false;
        }

        private void AboutUsBtn_Click(object sender, EventArgs e)
        {
            accountDetails.Visible = true;
            pagesPanel.Visible = false;
            createpost.Visible = false;
            viewPosts.Visible = false;
        }

        private void guna2Button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void guna2GradientPanel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void guna2Button3_Click(object sender, EventArgs e)
        {
            Form1 form1 = new Form1();
            form1.Show();
            this.Hide();
        }
    }
}
