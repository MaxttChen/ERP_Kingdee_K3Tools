using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Reflection;

namespace ERP_Tools
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
            //treeView.Click += TreeView_Click;
            treeView.NodeMouseClick += TreeView_NodeMouseClick;
        }

        private void TreeView_NodeMouseClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            splitContainer1.Panel2.Controls.Clear();
            //MessageBox.Show(e.Node.Name);
            Form form = (Form) Assembly.GetExecutingAssembly().CreateInstance("ERP_Tools." + e.Node.Name);
            form.TopLevel = false;
            form.FormBorderStyle = FormBorderStyle.None;
            form.Dock = DockStyle.Fill;
            splitContainer1.Panel2.Controls.Add(form);
            form.Show();
        }

    }
}
