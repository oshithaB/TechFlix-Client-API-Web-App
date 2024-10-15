<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="WebApplication2.Inventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
  <form id="form1" runat="server">
        <div>
            <h2>Inventory Management</h2>

            <label for="txtSupplier">Supplier Name:</label>
            <asp:TextBox ID="txtSupplier" runat="server"></asp:TextBox>
            <br /><br />

            <label for="txtItem">Item Name:</label>
            <asp:TextBox ID="txtItem" runat="server"></asp:TextBox>
            <br /><br />

            <label for="txtQuantity">Quantity Available:</label>
            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
            <br /><br />

            <asp:Button ID="btnAddInventory" runat="server" Text="Add Inventory Item" OnClick="btnAddInventory_Click" />
            <br /><br />

            <asp:GridView ID="gvInventory" runat="server" AutoGenerateColumns="True"></asp:GridView>
        </div>
    </form>
</body>
</html>
