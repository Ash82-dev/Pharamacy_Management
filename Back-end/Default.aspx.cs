using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Back_end
{
    public partial class _Default : Page
    {
        private static readonly string connectionString = "PUT YOUR CONNECTION STRING HERE";
        private readonly SqlConnection connection = new SqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DispalyTable();
            }
        }

        private void DispalyTable()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM MedicineTable";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                SqlCommandBuilder cmdBuilder = new SqlCommandBuilder(adapter);
                var ds = new DataSet();
                adapter.Fill(ds);
                gridView.DataSource = ds.Tables[0];
                gridView.DataBind();
                connection.Close();
            }
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(medName.Value) || category.SelectedIndex == -1 || string.IsNullOrEmpty(quantity.Value) || string.IsNullOrEmpty(price.Value) || manufacturer.SelectedIndex == -1)
            {
                Response.Write("Please complete all fields!");
                return;
            }
            else
            {
                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        SqlCommand cmd = new SqlCommand("INSERT INTO MedicineTable (name, category, quantity, price, manufacturer) VALUES (@MN, @MC, @MQ, @MP, @MM)", connection);
                        cmd.Parameters.AddWithValue("@MN", medName.Value);
                        cmd.Parameters.AddWithValue("@MC", category.SelectedItem.ToString());
                        cmd.Parameters.AddWithValue("@MQ", quantity.Value);
                        cmd.Parameters.AddWithValue("@MP", price.Value);
                        cmd.Parameters.AddWithValue("@MM", manufacturer.SelectedItem.ToString());
                        cmd.ExecuteNonQuery();
                        connection.Close();
                    }
                    DispalyTable();
                    ResetFields();
                    Response.Redirect(Request.RawUrl);
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }

        private void ResetFields()
        {
            medName.Value = string.Empty;
            category.SelectedIndex = -1;
            quantity.Value = string.Empty;
            price.Value = string.Empty;
            manufacturer.SelectedIndex = -1;
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            
        }

        protected void GridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}