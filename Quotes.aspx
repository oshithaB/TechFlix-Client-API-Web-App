<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quotes.aspx.cs" Inherits="WebApplication2.Quotes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quotes Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef; /* Light background color */
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background: #ffffff; /* White background for the card */
            padding: 20px;
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Soft shadow */
            transition: box-shadow 0.3s; /* Smooth transition for hover effect */
        }

        .container:hover {
            box-shadow: 0 8px 40px rgba(0, 0, 0, 0.2); /* Darker shadow on hover */
        }

        h2 {
            text-align: center;
            color: #333; /* Darker text color */
        }

        label {
            font-weight: bold;
            margin-top: 10px;
            color: #555; /* Slightly darker label color */
        }

        .form-control {
            width: 100%;
            padding: 12px;
            margin: 5px 0 20px 0;
            border: 1px solid #ced4da; /* Light border */
            border-radius: 4px; /* Rounded corners */
            transition: border-color 0.3s; /* Smooth transition for focus effect */
        }

        .form-control:focus {
            border-color: #80bdff; /* Change border color on focus */
            outline: none; /* Remove outline */
            box-shadow: 0 0 5px rgba(128, 189, 255, 0.5); /* Add shadow on focus */
        }

        .btn {
            background-color: #28a745; /* Green background */
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s; /* Smooth transition for hover effect */
        }

        .btn:hover {
            background-color: #218838; /* Darker green on hover */
        }

        .gridview-container {
            margin-top: 20px;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse; /* Ensure grid borders are collapsed */
        }

        .gridview th, .gridview td {
            padding: 10px;
            border: 1px solid #dee2e6; /* Light border for grid cells */
            text-align: left; /* Left-align text */
        }

        .gridview th {
            background-color: #f8f9fa; /* Light grey for header */
            color: #495057; /* Darker text for header */
        }

        .gridview tr:hover {
            background-color: #f1f1f1; /* Light grey on row hover */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Quotes Management</h2>
            <!-- Supplier Name Label and TextBox -->
            <asp:Label ID="lblSupplier" runat="server" Text="Supplier Name:" AssociatedControlID="txtSupplier"></asp:Label>
            <asp:TextBox ID="txtSupplier" runat="server" CssClass="form-control"></asp:TextBox>

            <!-- Item Name Label and TextBox -->
            <asp:Label ID="lblItem" runat="server" Text="Item Name:" AssociatedControlID="txtItem"></asp:Label>
            <asp:TextBox ID="txtItem" runat="server" CssClass="form-control"></asp:TextBox>

            <!-- Price Label and TextBox -->
            <asp:Label ID="lblPrice" runat="server" Text="Price:" AssociatedControlID="txtPrice"></asp:Label>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>

            <!-- Quantity Label and TextBox -->
            <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" AssociatedControlID="txtQuantity"></asp:Label>
            <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control"></asp:TextBox>

            <!-- Add Quote Button -->
            <asp:Button ID="btnAddQuote" runat="server" Text="Add Quote" OnClick="btnAddQuote_Click" CssClass="btn" />
            
            <!-- GridView to Display Quotes -->
            <div class="gridview-container">
                <asp:GridView ID="gvQuotes" runat="server" AutoGenerateColumns="True" CssClass="gridview" />
            </div>
        </div>
    </form>
</body>
</html>
