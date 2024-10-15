using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using WebApplication2;

public partial class Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadOrders(); // Load existing orders when the page first loads
        }
    }

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["TechFixDB"].ConnectionString;

        using (MySqlConnection conn = new MySqlConnection(connectionString))
        {
            // SQL query to insert an order into the database
            string query = "INSERT INTO orders (SupplierName, ItemName, Quantity, OrderDate) VALUES (@Supplier, @Item, @Quantity, NOW())";
            MySqlCommand cmd = new MySqlCommand(query, conn);

            // Add parameters to prevent SQL injection
            cmd.Parameters.AddWithValue("@Supplier", txtSupplier.Text);
            cmd.Parameters.AddWithValue("@Item", txtItem.Text);
            cmd.Parameters.AddWithValue("@Quantity", txtQuantity.Text);

            // Open the connection and execute the query
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        LoadOrders(); // Refresh the orders after placing a new order
    }

    private void LoadOrders()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["TechFixDB"].ConnectionString;

        using (MySqlConnection conn = new MySqlConnection(connectionString))
        {
            // SQL query to select all orders
            string query = "SELECT * FROM orders";
            MySqlCommand cmd = new MySqlCommand(query, conn);

            // Open the connection and execute the query
            conn.Open();
            MySqlDataReader reader = cmd.ExecuteReader();

            // Bind the data to the GridView
            gvOrders.DataSource = reader;
            gvOrders.DataBind();
            conn.Close();
        }
    }
}
