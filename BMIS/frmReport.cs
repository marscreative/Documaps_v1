using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using Microsoft.Reporting.WinForms;
using DocuMAP;

namespace BMIS
{
    public partial class frmReport : Form
    {
        SqlConnection cn;
        SqlCommand cm;

        public frmReport()
        {
            InitializeComponent();
            cn = new SqlConnection(dbconstring.connection);
        }

        private void frmReport_Load(object sender, EventArgs e)
        {

        }

        public void PreviewBlotter(string sql)
        {
            try
            {
                ReportDataSource rptDs;
                reportViewer1.LocalReport.ReportPath = Application.StartupPath + @"\Report\rptBlotter.rdlc";
                reportViewer1.LocalReport.DataSources.Clear();

                DataSet1 ds = new DataSet1();
                SqlDataAdapter da = new SqlDataAdapter();

                cn.Open();
                da.SelectCommand = new SqlCommand(sql, cn);
                da.Fill(ds.Tables["dtblotter"]);

                rptDs = new ReportDataSource("DataSet1", ds.Tables["dtblotter"]);
                reportViewer1.LocalReport.DataSources.Add(rptDs);
                reportViewer1.SetDisplayMode(Microsoft.Reporting.WinForms.DisplayMode.PrintLayout);
                reportViewer1.ZoomMode = ZoomMode.Percent;
                reportViewer1.ZoomPercent = 100;
                cn.Close();
            }catch (Exception ex)
            {
                cn.Close();
                MessageBox.Show(ex.Message,var._title,MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
    }
}
