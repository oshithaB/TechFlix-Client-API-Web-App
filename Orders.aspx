<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="WebApplication2.Orders" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Orders</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Order Management</h2>

            <!-- Supplier Name Input -->
            <label for="txtSupplier">Supplier Name:</label>
            <asp:TextBox ID="txtSupplier" runat="server"></asp:TextBox>
            <br /><br />

            <!-- Item Name Input -->
            <label for="txtItem">Item Name:</label>
            <asp:TextBox ID="txtItem" runat="server"></asp:TextBox>
            <br /><br />

            <!-- Quantity Input -->
            <label for="txtQuantity">Quantity:</label>
            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
            <br /><br />

            <!-- Place Order Button -->
            <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" OnClick="btnPlaceOrder_Click" />
            <br /><br />

            <!-- Orders GridView -->
            <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="True"></asp:GridView>
        </div>
    </form>
</body>
</html>