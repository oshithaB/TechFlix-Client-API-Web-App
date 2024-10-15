using System;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class Quotes : System.Web.UI.Page
    {
        // On page load, ensure the quotes are loaded if it is not a postback
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadQuotes();  // Load existing quotes when the page is first loaded
            }
        }

        // Event handler for Add Quote button
        protected void btnAddQuote_Click(object sender, EventArgs e)
        {
            // Get connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["TechFixDB"].ConnectionString;

            // Insert the new quote into the database
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO quotes (SupplierName, ItemName, Price, QuantityAvailable) VALUES (@Supplier, @Item, @Price, @Quantity)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Supplier", txtSupplier.Text);
                cmd.Parameters.AddWithValue("@Item", txtItem.Text);
                cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
                cmd.Parameters.AddWithValue("@Quantity", txtQuantity.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
            }


            LoadQuotes(); // Refresh the GridView to show the updated list of quotes
        }

        // Method to load existing quotes into the GridView
        private void LoadQuotes()
        {
            // Get connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["TechFixDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM quotes";  // Fetch all quotes from the database
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();  // Execute the query

                // Bind the retrieved data to the GridView
                gvQuotes.DataSource = reader;
                gvQuotes.DataBind();

                conn.Close();
            }
        }
    }
}
