<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Customers.aspx.cs" Inherits="admin_Customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:GridView ID="gvCustomers" runat="server" class="gv" AutoGenerateColumns="False" DataSourceID="SqlDataSource" 
        onselectedindexchanged="gvCustomers_SelectedIndexChanged" AllowPaging="True"
            AllowSorting="True" PageSize="10"
            DataKeyNames="customerID" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="customerID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="customerID" />
                <asp:BoundField DataField="customerName" HeaderText="Name" 
                    SortExpression="customerName" />
                <asp:BoundField DataField="customerGender" HeaderText="Gender" 
                    SortExpression="customerGender" />
                <asp:BoundField DataField="customerAddress" HeaderText="Address" 
                    SortExpression="customerAddress" />
                <asp:BoundField DataField="customerCellPhone" HeaderText="CellPhone" 
                    SortExpression="customerCellPhone" />
                <asp:BoundField DataField="customerEmail" HeaderText="Email" 
                    SortExpression="customerEmail" />
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
            SelectCommand="SELECT customerID, customerLName+', '+customerFName AS customerName,customerGender,customerAddress,customerCellPhone,customerEmail FROM customers ORDER BY CustomerLName">
        </asp:SqlDataSource>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-3 col-sm-2 col-sm-offset-2">
        <asp:Button class="btn btn-primary btn-block" ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" CausesValidation="False" />
        </div>
        <div class="col-xs-3 col-sm-2">
        <asp:Button CssClass="btn btn-primary btn-block disabled" ID="btnDelete" runat="server" Text="Delete" 
            onclick="btnDelete_Click" CausesValidation="False" 
            PostBackUrl="Customers.aspx" />
        </div>
        <div class="col-xs-3 col-sm-2">
        <asp:Button CssClass="btn btn-primary btn-block disabled" ID="btnUpdate" runat="server" Text="Update" onclick="btnUpdate_Click" CausesValidation="False" />
        </div>
        <div class="col-xs-3 col-sm-2">
        <asp:Button class="btn btn-primary btn-block" ID="btnBack" runat="server" Text="Back" onclick="btnBack_Click" CausesValidation="False" />
        </div>
    </div>
</asp:Content>

