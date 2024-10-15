using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using WebApplication2;

namespace WebApplication2
{
    public partial class Inventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadInventory();
            }
        }

        protected void btnAddInventory_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["TechFixDB"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                string query = "INSERT INTO inventory (SupplierName, ItemName, QuantityAvailable) VALUES (@Supplier, @Item, @Quantity)";
                MySqlCommand cmd = new MySqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Supplier", txtSupplier.Text);
                cmd.Parameters.AddWithValue("@Item", txtItem.Text);
                cmd.Parameters.AddWithValue("@Quantity", txtQuantity.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            LoadInventory(); // Refresh grid after adding item
        }

        private void LoadInventory()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["TechFixDB"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                string query = "SELECT * FROM inventory";
                MySqlCommand cmd = new MySqlCommand(query, conn);
                conn.Open();
                MySqlDataReader reader = cmd.ExecuteReader();

                gvInventory.DataSource = reader;
                gvInventory.DataBind();
            }
        }
    }
}
