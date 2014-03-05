<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Transaction.aspx.cs" Inherits="Transaction" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/datepicker.css" rel="stylesheet" />
    <link href="../less/datepicker.less" rel="stylesheet" />
    <style type="text/css">
    .gv
    {
        text-align:center;
        margin-right:auto;
        margin-left:auto;
        background-color:White;
        border:2px solid black;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="row">
            <div class="col-xs-4 col-xs-offset-1">
                <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name:"></asp:Label>
            </div>
            <div class="col-xs-6">
                <asp:Label ID="lblName" runat="server"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-4 col-xs-offset-1">
                <asp:Label ID="lblBookingStart" runat="server" Text="Check In:"></asp:Label>
            </div>
            <div class="col-xs-6">
                <asp:Label ID="lblStart" runat="server"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-4 col-xs-offset-1">
                <asp:Label ID="lblBookingEnd" runat="server" Text="Check Out:"></asp:Label>
            </div>
            <div class="col-xs-6">
                <asp:Label ID="lblEnd" runat="server"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-4 col-xs-offset-1">
                <asp:Label ID="lblBookingDays" runat="server" Text="Number of days:"></asp:Label>
            </div>
            <div class="col-xs-6">
                <asp:Label ID="lblDays" runat="server"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-4 col-xs-offset-1">
                <asp:Label ID="lblRoomName" runat="server" Text="Room:"></asp:Label>
            </div>
            <div class="col-xs-6">
                <asp:Label ID="lblRoom" runat="server"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-4 col-xs-offset-1">
                <asp:Label ID="lblRoomPrice" runat="server" Text="PricePerNight:"></asp:Label>
            </div>
            <div class="col-xs-6">
                <asp:Label ID="lblPrice" runat="server"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-4 col-xs-offset-1">
                <asp:Label ID="lblTotalPrice" runat="server" Text="Total Price:"></asp:Label>
            </div>
            <div class="col-xs-6">
                <asp:Label ID="lblTotal" runat="server"></asp:Label>
            </div>
        </div>
        <br />

        <asp:GridView ID="gvTransactions" runat="server" class="gv" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource" 
        onselectedindexchanged="gvTransactions_SelectedIndexChanged" AllowPaging="True"
            AllowSorting="True" PageSize="10"
            DataKeyNames="TransactionID" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="serviceName" HeaderText="Service" InsertVisible="False" 
                    ReadOnly="True" SortExpression="serviceName" />
                <asp:BoundField DataField="servicePrice" HeaderText="Price" InsertVisible="False" 
                    ReadOnly="True" SortExpression="servicePrice"/>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:kabayanConnectionString %>" 
            SelectCommand="SELECT transactions.transactionId, services.serviceName, services.servicePrice FROM Transactions INNER JOIN services ON transactions.serviceID = services.serviceID WHERE bookingId = @bookingID;">
            <SelectParameters>
                <asp:Parameter Name="bookingId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <asp:Label ID="lblServSum" runat="server" Text="Total Price of Services:"></asp:Label>
    <asp:Label ID="lblSum" runat="server"></asp:Label>
    <br />
    <asp:Label ID="lblTotalServBook" runat="server" Text="Grand Total:"></asp:Label>
    <asp:Label ID="lblServBook" runat="server"></asp:Label>
    <br />
    <div class="row">
        <div class="col-xs-4 col-xs-offset-4">
        <asp:Button CssClass="btn btn-primary btn-block disabled" ID="btnDelete" runat="server" Text="Delete" 
            onclick="btnDelete_Click" CausesValidation="False" 
            PostBackUrl="transaction.aspx" />
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-4 col-xs-offset-2">
            <asp:DropDownList class="form-control" ID="ddlService" runat="server">
            </asp:DropDownList>
        </div>
        <div class="col-xs-3">
            <asp:Button class="btn btn-primary btn-block" ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" CausesValidation="False" />
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-4 col-xs-offset-4">
        <asp:Button class="btn btn-primary btn-block" ID="btnBack" runat="server" Text="Back" onclick="btnBack_Click" CausesValidation="False" />
        </div>
    </div>
    </form>
</body>
</html>
