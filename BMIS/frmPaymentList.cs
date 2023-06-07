using System;
using System.Windows.Forms;
using System.Data.SqlClient;
using BMIS;

namespace DocuMAP
{
    public partial class frmPaymentList : Form
    {
        SqlConnection cn;
        SqlCommand cm;
        SqlDataReader dr;

        public frmPaymentList()
        {
            InitializeComponent();
            cn = new SqlConnection(dbconstring.connection);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            frmPayment f = new frmPayment(this);
            f.GetReferenceNo();
            f.Show();
        }

        public void LoadRecords()
        {
            try
            {
                double _amount = 0;
                dataGridView1.Rows.Clear();
                cn.Open();
                cm = new SqlCommand("select * from tblpayment", cn);
                dr = cm.ExecuteReader();
                while (dr.Read())
                {
                    _amount += double.Parse(dr["amount"].ToString());
                    dataGridView1.Rows.Add(dr["id"].ToString(), dr["refno"].ToString(), dr["name"].ToString(), dr["type"].ToString(), dr["amount"].ToString(), DateTime.Parse(dr["sdate"].ToString()).ToString("MM-dd-yyyy"), dr["suser"].ToString());
                }
                dr.Close();
                cn.Close();
                dataGridView1.ClearSelection();
                lblAmount.Text = _amount.ToString("#,##0.00");


            }catch (Exception ex)
            {
                cn.Close();
                MessageBox.Show(ex.Message, var._title, MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            string colName = dataGridView1.Columns[e.ColumnIndex].Name;
            if (colName == "btnDelete")
            {
                if (MessageBox.Show("Do you want to delete this record?", var._title,MessageBoxButtons.YesNo,MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    cn.Open();
                    cm = new SqlCommand("delete from tblPayment where id = @id", cn);
                    cm.Parameters.AddWithValue("@id", dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString());
                    cm.ExecuteNonQuery();
                    cn.Close();
                    MessageBox.Show("Record has been deleted!", var._title, MessageBoxButtons.OK, MessageBoxIcon.Information);
                    LoadRecords();
                }
            }

        }
    }
}
